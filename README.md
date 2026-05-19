# Shashank Obla — Academic Website

Personal academic website built with [Hugo](https://gohugo.io/) and the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme, using [Pascal Michaillat's minimalist academic template](https://github.com/pmichaillat/hugo-website) as the base.

## Repository Branches

This repository contains different versions of the website across the following branches:

- **`main`**: The active website built using **Hugo** and the **PaperMod** theme.
- **`mkdocs`**: The archive branch containing the previous version of the website built using **MkDocs**.
- **`hugo-blox`**: An archive branch containing a draft migration built using the **Hugo Blox** (academic) theme.

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
│   ├── _index.md           # Homepage profile metadata
│   ├── bio/index.md        # Bio page content
│   ├── teaching/_index.md  # Teaching page
│   ├── projects/           # Projects section
│   ├── publications/       # Publications section (individual Markdown files)
│   ├── service/            # Service & community involvement page
│   └── resume/index.md     # Resume page (embeds PDF)
├── static/
│   ├── picture.jpeg        # Profile photo
│   └── uploads/            # PDFs, slides, and other media assets
├── assets/
│   └── css/extended/       # Custom user-defined CSS overrides
├── layouts/
│   └── partials/           # Customized HTML components and icons (svg.html)
└── themes/PaperMod/        # Git submodule for the PaperMod theme
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
