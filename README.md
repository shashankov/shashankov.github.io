# Shashank Obla — Academic Website

Personal academic website built with [Hugo](https://gohugo.io/) and the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme, using [Pascal Michaillat's minimalist academic template](https://github.com/pmichaillat/hugo-website) as the base.

## Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| [Hugo Extended](https://gohugo.io/installation/) | ≥ 0.112 | See [Hugo releases](https://github.com/gohugoio/hugo/releases) |
| [Git](https://git-scm.com/) | any | `sudo apt install git` |

**No Node.js, pnpm, or Go required.**

## Quick Start

```bash
# 1. Clone the repo with the theme submodule
git clone --recurse-submodules <repo-url>

# Or, if already cloned, fetch the theme:
git submodule update --init --recursive

# 2. Start the local dev server
hugo server --baseURL http://localhost:1313/

# 3. Open http://localhost:1313 in your browser
```

> **Note:** The production `baseURL` is set to `https://www.andrew.cmu.edu/user/sobla/` in `config.yml`.  
> For local development, always pass `--baseURL http://localhost:1313/` to override it.

## Structure

```
├── config.yml              # All site config (single file)
├── content/
│   ├── _index.md           # Homepage (profileMode from config.yml)
│   ├── bio/index.md        # Bio page
│   ├── teaching/_index.md  # Teaching page
│   ├── projects/           # Projects section
│   ├── resume/index.md     # Resume page (embeds PDF)
│   └── contact/index.md    # Contact page + calendar
├── static/
│   ├── picture.jpeg        # Profile photo
│   └── uploads/            # PDFs, images, etc.
├── layouts/partials/
│   └── svg.html            # Custom social icons (CV, Google Scholar, etc.)
└── themes/PaperMod/        # Git submodule
```

## Updating the Theme

```bash
git submodule update --remote themes/PaperMod
```

## Deployment

Build the static site:

```bash
hugo --minify
```

The output is in `public/`. Upload to Andrew FileSpace or any static host.

## Custom Shortcodes (Alerts)

This theme includes a custom shortcode for MkDocs-style colored admonitions/alerts. 
You can use the `{{< alert >}}` shortcode in any Markdown file to draw attention to important text.

There are four available types:
- `info` (Blue, default)
- `success` (Green)
- `warning` (Yellow)
- `danger` (Red)

**Usage Example:**
```markdown
{{< alert type="info" >}}
This is a standard informational note.
{{< /alert >}}
```
