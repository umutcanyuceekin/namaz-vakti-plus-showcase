#!/bin/bash

# ═══════════════════════════════════════════════════════════════════════════
# Namaz Vakti+ Showcase - GitHub Push Script
# UCY Digital
# ═══════════════════════════════════════════════════════════════════════════

set -e

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║       Namaz Vakti+ Showcase - GitHub Push Script             ║"
echo "║                      UCY Digital                              ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "❌ Git is not installed. Please install git first."
    exit 1
fi

# Get repository URL from user
echo "📌 Please enter your GitHub repository URL:"
echo "   (Example: https://github.com/username/namaz-vakti-plus-showcase.git)"
echo ""
read -p "Repository URL: " REPO_URL

if [ -z "$REPO_URL" ]; then
    echo "❌ Repository URL cannot be empty!"
    exit 1
fi

echo ""
echo "🔄 Initializing repository..."

# Initialize git if not already initialized
if [ ! -d ".git" ]; then
    git init
    git branch -M main
fi

# Add all files
echo "📁 Adding files..."
git add .

# Commit
echo "📝 Creating commit..."
git commit -m "feat: initial showcase release for Namaz Vakti+ application" --allow-empty

# Add remote (or update if exists)
echo "🔗 Configuring remote..."
git remote remove origin 2>/dev/null || true
git remote add origin "$REPO_URL"

# Push
echo "🚀 Pushing to GitHub..."
git push -u origin main --force

echo ""
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                    ✅ SUCCESS!                                ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo ""
echo "Your showcase has been pushed to:"
echo "👉 $REPO_URL"
echo ""
echo "Next steps:"
echo "  1. Add screenshots to assets/screenshots/"
echo "  2. Update README.md with your actual screenshots"
echo "  3. Share the repository link with recruiters/investors"
echo ""
