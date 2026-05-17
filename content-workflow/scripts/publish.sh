#!/usr/bin/env bash
# publish.sh — move a draft to published/ and append to index.json
# Usage: ./scripts/publish.sh <linkedin|twitter> drafts/<filename>.md

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <linkedin|twitter> <draft-path-relative-to-platform-dir>" >&2
  echo "Example: $0 linkedin drafts/2026-05-20-rag-pipeline.md" >&2
  exit 1
fi

platform="$1"
draft_rel="$2"

if [ "$platform" != "linkedin" ] && [ "$platform" != "twitter" ]; then
  echo "Error: platform must be 'linkedin' or 'twitter'" >&2
  exit 1
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"
platform_dir="$root_dir/$platform"

draft_path="$platform_dir/$draft_rel"
if [ ! -f "$draft_path" ]; then
  echo "Error: draft not found: $draft_path" >&2
  exit 1
fi

filename="$(basename "$draft_path")"
published_path="$platform_dir/published/$filename"

if [ -e "$published_path" ]; then
  echo "Error: a published file with this name already exists: $published_path" >&2
  exit 1
fi

# Parse frontmatter fields needed for the index entry.
# Frontmatter is the block between the first two '---' lines.
extract_field() {
  local field="$1"
  awk -v f="$field" '
    /^---$/ { count++; next }
    count == 1 {
      if ($0 ~ "^"f":") {
        sub("^"f":[[:space:]]*", "")
        print
        exit
      }
    }
  ' "$draft_path"
}

date_field="$(extract_field date)"
pillar="$(extract_field pillar)"
heading="$(extract_field heading)"
topics_raw="$(extract_field topics)"

if [ -z "$date_field" ] || [ -z "$pillar" ] || [ -z "$heading" ]; then
  echo "Error: draft missing required frontmatter (date, pillar, heading)" >&2
  exit 1
fi

if [ "$pillar" = "TODO" ]; then
  echo "Error: pillar still set to TODO — set it before publishing" >&2
  exit 1
fi

# Move the file
mv "$draft_path" "$published_path"
echo "Moved: $draft_path -> $published_path"

# Update index.json using Python (more reliable than jq for nested writes)
index_file="$platform_dir/index.json"
python3 - "$index_file" "$date_field" "$pillar" "$heading" "$topics_raw" "$filename" <<'PY'
import json
import sys
import re

index_file, date_field, pillar, heading, topics_raw, filename = sys.argv[1:7]

with open(index_file, "r") as f:
    data = json.load(f)

# Parse topics: expect format like "[a, b, c]" or "[]"
topics = []
m = re.match(r"\s*\[(.*)\]\s*$", topics_raw or "")
if m and m.group(1).strip():
    topics = [t.strip().strip('"').strip("'") for t in m.group(1).split(",") if t.strip()]

entry = {
    "date": date_field,
    "heading": heading,
    "pillar": pillar,
    "topics": topics,
    "file": f"published/{filename}",
    "engagement": {"likes": None, "comments": None, "reach": None}
}

data.setdefault("posts", []).append(entry)
# Keep posts sorted by date descending for easy reading
data["posts"].sort(key=lambda p: p.get("date", ""), reverse=True)

with open(index_file, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")

print(f"Updated index: {index_file}")
PY

echo "Published."
