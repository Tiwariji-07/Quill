#!/usr/bin/env bash
# publish.sh — move a draft to published/ and append to index.json
# Usage:
#   ./scripts/publish.sh <linkedin|twitter|medium> drafts/<filename>.md
#   ./scripts/publish.sh linkedin drafts/<filename>.md --page talkbeyondcode

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <linkedin|twitter|medium> <draft-path-relative-to-platform-dir>" >&2
  echo "Example: $0 linkedin drafts/2026-05-20-rag-pipeline.md" >&2
  echo "Example: $0 medium drafts/2026-06-20-multi-source-rag.md" >&2
  echo "Example: $0 linkedin drafts/2026-06-12-episode-1-launch.md --page talkbeyondcode" >&2
  exit 1
fi

platform="$1"
draft_rel="$2"
shift 2

if [ "$platform" != "linkedin" ] && [ "$platform" != "twitter" ] && [ "$platform" != "medium" ]; then
  echo "Error: platform must be 'linkedin', 'twitter', or 'medium'" >&2
  exit 1
fi

page=""
if [ $# -gt 0 ]; then
  if [ $# -ne 2 ] || [ "$1" != "--page" ]; then
    echo "Usage: $0 <linkedin|twitter> <draft-path-relative-to-platform-dir> [--page page-slug]" >&2
    exit 1
  fi
  page="$2"
fi

if [ -n "$page" ]; then
  case "$page" in
    *[!A-Za-z0-9_-]*)
      echo "Error: page slug can only contain letters, numbers, underscores, and hyphens" >&2
      exit 1
      ;;
  esac
fi

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"

if [ -n "$page" ]; then
  platform_dir="$root_dir/pages/$page/$platform"
else
  platform_dir="$root_dir/$platform"
fi

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
account="$(extract_field account)"
surface="$(extract_field surface)"
content_type="$(extract_field content_type)"
asset="$(extract_field asset)"

if [ -z "$date_field" ] || [ -z "$pillar" ] || [ -z "$heading" ]; then
  echo "Error: draft missing required frontmatter (date, pillar, heading)" >&2
  exit 1
fi

if [ "$pillar" = "TODO" ]; then
  echo "Error: pillar still set to TODO — set it before publishing" >&2
  exit 1
fi

index_file="$platform_dir/index.json"
if [ ! -f "$index_file" ]; then
  echo "Error: index not found: $index_file" >&2
  exit 1
fi

tmp_index="$(mktemp "${index_file}.tmp.XXXXXX")"
trap 'rm -f "$tmp_index"' EXIT

# Prepare the new index with Python before moving the draft.
python3 - "$index_file" "$tmp_index" "$date_field" "$pillar" "$heading" "$topics_raw" "$filename" "$account" "$surface" "$content_type" "$asset" <<'PY'
import json
import sys
import re

(
    index_file,
    tmp_index,
    date_field,
    pillar,
    heading,
    topics_raw,
    filename,
    account,
    surface,
    content_type,
    asset,
) = sys.argv[1:12]

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

for key, value in {
    "account": account,
    "surface": surface,
    "content_type": content_type,
    "asset": asset,
}.items():
    if value and value != "TODO":
        entry[key] = value

data.setdefault("posts", []).append(entry)
# Keep posts sorted by date descending for easy reading
data["posts"].sort(key=lambda p: p.get("date", ""), reverse=True)

with open(tmp_index, "w") as f:
    json.dump(data, f, indent=2)
    f.write("\n")

print(f"Prepared index: {tmp_index}")
PY

# Move the file, then atomically replace the index file.
mv "$draft_path" "$published_path"
echo "Moved: $draft_path -> $published_path"

mv "$tmp_index" "$index_file"
trap - EXIT
echo "Updated index: $index_file"

echo "Published."
