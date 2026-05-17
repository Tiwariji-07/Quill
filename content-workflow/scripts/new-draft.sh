#!/usr/bin/env bash
# new-draft.sh — scaffold a new draft file with frontmatter
# Usage: ./scripts/new-draft.sh <linkedin|twitter> "kebab or free-form heading"

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <linkedin|twitter> \"heading\"" >&2
  exit 1
fi

platform="$1"
heading_raw="$2"

if [ "$platform" != "linkedin" ] && [ "$platform" != "twitter" ]; then
  echo "Error: platform must be 'linkedin' or 'twitter'" >&2
  exit 1
fi

# Resolve script dir so the script works from any cwd
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"

date_str="$(date +%Y-%m-%d)"
slug="$(echo "$heading_raw" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')"
file="$root_dir/$platform/drafts/${date_str}-${slug}.md"

if [ -e "$file" ]; then
  echo "Error: $file already exists" >&2
  exit 1
fi

cat > "$file" <<EOF
---
date: $date_str
pillar: TODO
topics: []
status: draft
platform: $platform
heading: $heading_raw
---

<!-- draft body below -->
EOF

echo "Created: $file"
