#!/usr/bin/env bash
# Migration script: Hugo Blox → PaperMod (pmichaillat/hugo-website template)
# Run from the website root: bash migrate_to_papermod.sh
set -e
cd "$(dirname "$0")"

echo ""
echo "=== Step 1: Creating papermod-theme branch ==="
git checkout -b papermod-theme

echo ""
echo "=== Step 2: Adding PaperMod as git submodule ==="
git submodule add https://github.com/adityatelange/hugo-PaperMod themes/PaperMod

echo ""
echo "=== Step 3: Copying avatar to static/ ==="
cp assets/media/avatar.jpg static/picture.jpeg
echo "Avatar copied to static/picture.jpeg"

echo ""
echo "=== Step 4: Removing Hugo Blox config directory ==="
rm -rf config/_default
echo "Deleted config/_default/"

echo ""
echo "=== Step 5: Removing Hugo module files ==="
rm -f go.mod go.sum
echo "Deleted go.mod, go.sum"

echo ""
echo "=== Step 6: Removing Hugo Blox meta files ==="
rm -f hugoblox.yaml hugo_stats.json
echo "Deleted hugoblox.yaml, hugo_stats.json"

echo ""
echo "=== Step 7: Removing Node.js files ==="
rm -f package.json pnpm-lock.yaml .npmrc
rm -rf node_modules
echo "Deleted package.json, pnpm-lock.yaml, .npmrc, node_modules/"

echo ""
echo "=== Step 8: Removing stale build caches ==="
rm -rf public resources
echo "Deleted public/ and resources/"

echo ""
echo "=== Step 9: Downloading PaperMod SVG icons partial ==="
mkdir -p layouts/partials
curl -fsSL "https://raw.githubusercontent.com/pmichaillat/hugo-website/main/layouts/partials/svg.html" \
  -o layouts/partials/svg.html
echo "Downloaded layouts/partials/svg.html"

echo ""
echo "=== Step 10: Removing old Hugo Blox layout hooks ==="
# Only remove the Blox-specific hooks directory, not the entire layouts folder
if [ -d "layouts/_partials" ]; then
  rm -rf layouts/_partials
  echo "Deleted layouts/_partials/"
else
  echo "No layouts/_partials/ found (already clean)"
fi

echo ""
echo "=== Step 11: Testing hugo build ==="
hugo --quiet 2>&1 || {
  echo ""
  echo "⚠️  Hugo build produced warnings/errors above."
  echo "Check the output and run 'hugo server' to debug."
  exit 1
}

echo ""
echo "=== Step 12: Committing all changes ==="
git add -A
git commit -m "Migrate to PaperMod (pmichaillat/hugo-website template)

- Replace Hugo Blox with PaperMod via git submodule
- Add single flat config.yml (profileMode for homepage)
- Remove go.mod/go.sum, hugoblox.yaml, Node.js/pnpm dependencies
- Migrate content front matter (remove Blox-specific type/summary fields)
- Copy avatar to static/picture.jpeg
- Update .gitignore for PaperMod build artifacts"

echo ""
echo "✅ Migration complete! Now run:"
echo "   hugo server"
echo "   Then open http://localhost:1313"
