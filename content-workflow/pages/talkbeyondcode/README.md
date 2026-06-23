# Talk Beyond Code workspace

This folder manages Talk Beyond Code as a page/brand, separate from Vivek's personal LinkedIn and X content.

## Public links

- LinkedIn: https://www.linkedin.com/company/talkbeyondcode/
- YouTube: https://www.youtube.com/@talkbeyondcode

## Use this workspace for

- LinkedIn company page profile copy and setup notes
- Podcast launch planning
- LinkedIn page drafts
- Published LinkedIn page ledger
- Brand-safe asset references
- Weekly page review and content planning

## Folder layout

```text
pages/talkbeyondcode/
├── brand.md                  # brand, voice, visual rules
├── README.md                 # this file
├── assets/                   # poster, BTS photos, thumbnails, carousel exports
└── linkedin/
    ├── page.md               # LinkedIn page setup and operating rules
    ├── index.json            # source of truth for published page posts
    ├── drafts/               # draft posts for the company page
    └── published/            # only publish.sh moves drafts here
```

## Create a page draft

From `content-workflow/`:

```bash
./scripts/new-draft.sh linkedin "episode 1 launch" --page talkbeyondcode
```

For a full guided draft:

```bash
claude "$(cat commands/draft-page-linkedin.md)
Page: talkbeyondcode
Topic: <topic or raw notes>"
```

## Publish a page draft

Only use the script:

```bash
./scripts/publish.sh linkedin drafts/2026-06-12-episode-1-launch.md --page talkbeyondcode
```

## Separation rule

Vivek's personal content uses:

- `linkedin/`
- `twitter/`
- `voice.md`
- `pillars.md`
- `overrides/`

Talk Beyond Code uses:

- `pages/talkbeyondcode/brand.md`
- `pages/talkbeyondcode/linkedin/page.md`
- `pages/talkbeyondcode/linkedin/index.json`

Do not draft company page content in Vivek's personal `linkedin/drafts/`.
