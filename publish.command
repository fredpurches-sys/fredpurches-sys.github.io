#!/bin/bash
# Double-click this file (or run it) to publish your site to GitHub Pages.
# It commits every change in this folder and pushes it live.

cd "$(dirname "$0")" || exit 1

echo "📦  Publishing site from: $(pwd)"
echo

# Stage everything
git add -A

# Nothing to do?
if git diff --cached --quiet; then
  echo "✅  Nothing new to publish — your site is already up to date."
  echo
  read -n 1 -s -r -p "Press any key to close..."
  exit 0
fi

# Show what's changing
echo "Changes to publish:"
git status --short
echo

# Commit with a timestamped message
git commit -m "Publish update $(date '+%Y-%m-%d %H:%M:%S')" >/dev/null
git push origin main

echo
echo "🚀  Pushed! Your site will be live in ~1 minute at:"
echo "    https://fredpurches-sys.github.io/"
echo
read -n 1 -s -r -p "Press any key to close..."
