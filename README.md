# Shashank Obla — Academic Website

Personal academic website built with [Hugo](https://gohugo.io/) and [Hugo Blox](https://hugoblox.com/) (Academic CV template).

## Prerequisites

You need these tools installed to build or develop the site locally:

| Tool | Version | Install |
|------|---------|---------|
| [Hugo Extended](https://gohugo.io/installation/) | ≥ 0.161.1 | See [Hugo releases](https://github.com/gohugoio/hugo/releases) |
| [Go](https://go.dev/dl/) | ≥ 1.18 | `sudo apt install golang` or download from go.dev |
| [Node.js](https://nodejs.org/) | ≥ 20 LTS | Download from nodejs.org or use `nvm` |
| [pnpm](https://pnpm.io/) | ≥ 10 | `npm install -g pnpm` |

## Quick Start

```bash
# 1. Install Node.js dependencies (Tailwind CSS, Pagefind search)
pnpm install

# 2. Start local dev server with live reload
pnpm dev
# Or equivalently:
# hugo server --disableFastRender

# 3. Open http://localhost:1313 in your browser
```

## Building for Production

```bash
pnpm build
# Or manually:
# hugo --minify && pagefind --site public
```

The built site will be in the `public/` directory. Upload this folder to your web server.

## Directory Structure

```
.
├── config/_default/        # Site configuration
│   ├── hugo.yaml           #   Hugo settings (baseURL, language, etc.)
│   ├── params.yaml         #   Site identity, theme, analytics, social links
│   └── menus.yaml          #   Navigation menu items
├── content/                # All page content (Markdown)
│   ├── _index.md           #   Homepage (landing page blocks)
│   ├── authors/admin/      #   Your author profile (bio, avatar, social links)
│   │   ├── _index.md       #     Profile data and bio text
│   │   └── avatar.jpg      #     Profile picture
│   ├── bio/index.md        #   Detailed bio page
│   ├── teaching/           #   Teaching section
│   │   ├── _index.md       #     Teaching assistantships
│   │   ├── misc.md         #     Miscellaneous teaching resources
│   │   └── ethics.md       #     Ethics page
│   ├── projects/           #   Projects section
│   │   ├── _index.md       #     Projects listing
│   │   └── token-system/   #     Token System project
│   ├── resume/index.md     #   Resume with embedded PDF
│   └── contact/index.md    #   Contact info and calendar
├── assets/media/           # Images processed by Hugo (avatar, etc.)
├── static/uploads/         # Static files served as-is (PDFs, images)
├── go.mod                  # Hugo module dependencies (theme)
├── package.json            # Node.js dependencies (Tailwind, Pagefind)
└── hugoblox.yaml           # Hugo Blox build configuration
```

## How to Edit Content

### Edit your profile
Edit `content/authors/admin/_index.md`:
- Update the YAML front matter for name, role, organizations, social links, education, work experience
- Update the Markdown body text below `---` for your bio paragraph

### Edit a page
Each page is a Markdown file in `content/`. Simply edit the `.md` file:
- The YAML front matter between `---` markers controls the page title and metadata
- The content below is standard Markdown

### Add a new page
1. Create a new folder under `content/`, e.g. `content/new-page/`
2. Create an `index.md` file inside it:
   ```markdown
   ---
   title: My New Page
   summary: A short description
   type: page
   ---

   Your content here in Markdown...
   ```
3. Add a menu entry in `config/_default/menus.yaml`:
   ```yaml
   - name: New Page
     url: /new-page/
     weight: 70
   ```

### Add a static file (PDF, image)
Place the file in `static/uploads/` and link to it as `/uploads/filename.pdf`.

### Change site settings
- **Site name, description, analytics**: `config/_default/params.yaml`
- **Base URL**: `config/_default/hugo.yaml` → `baseURL`
- **Navigation menu**: `config/_default/menus.yaml`
- **Colors/theme**: `config/_default/params.yaml` → `hugoblox.theme.colors`

## Regenerating the Site

After making changes:

```bash
# Preview locally
pnpm dev

# Build for deployment
pnpm build
```

Then upload the `public/` folder to your web server.
