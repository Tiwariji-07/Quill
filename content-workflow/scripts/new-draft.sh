#!/usr/bin/env bash
# new-draft.sh — scaffold a new draft file with frontmatter
# Usage:
#   ./scripts/new-draft.sh <linkedin|twitter|medium> "kebab or free-form heading"
#   ./scripts/new-draft.sh linkedin "kebab or free-form heading" --page talkbeyondcode

set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Usage: $0 <linkedin|twitter|medium> \"heading\"" >&2
  echo "       $0 linkedin \"heading\" --page talkbeyondcode" >&2
  exit 1
fi

platform="$1"
heading_raw="$2"
shift 2

if [ "$platform" != "linkedin" ] && [ "$platform" != "twitter" ] && [ "$platform" != "medium" ]; then
  echo "Error: platform must be 'linkedin', 'twitter', or 'medium'" >&2
  exit 1
fi

page=""
if [ $# -gt 0 ]; then
  if [ $# -ne 2 ] || [ "$1" != "--page" ]; then
    echo "Usage: $0 <linkedin|twitter> \"heading\" [--page page-slug]" >&2
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

# Resolve script dir so the script works from any cwd
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
root_dir="$(cd "$script_dir/.." && pwd)"

date_str="$(date +%Y-%m-%d)"
slug="$(echo "$heading_raw" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed -E 's/^-+|-+$//g')"

if [ -n "$page" ]; then
  platform_dir="$root_dir/pages/$page/$platform"
  account="$page"
  surface="company-page"
else
  platform_dir="$root_dir/$platform"
  account="personal"
  if [ "$platform" = "medium" ]; then
    surface="medium"
  else
    surface="personal-profile"
  fi
fi

if [ ! -d "$platform_dir/drafts" ]; then
  echo "Error: drafts directory not found: $platform_dir/drafts" >&2
  exit 1
fi

file="$platform_dir/drafts/${date_str}-${slug}.md"

if [ -e "$file" ]; then
  echo "Error: $file already exists" >&2
  exit 1
fi

{
  echo "---"
  echo "date: $date_str"
  echo "pillar: TODO"
  echo "topics: []"
  echo "status: draft"
  echo "platform: $platform"
  echo "account: $account"
  echo "surface: $surface"
  # Page (company-page) drafts carry the extra fields that publish.sh reads
  # and that commands/draft-page-linkedin.md expects.
  if [ -n "$page" ]; then
    echo "content_type: TODO"
    echo "asset: TODO"
  fi
  echo "heading: $heading_raw"
  echo "---"
  echo ""
  echo "<!-- draft body below -->"
} > "$file"

echo "Created: $file"
