#!/bin/bash

# 🚀 Fluffy Bot / Cool Boy - Quick Deploy Script
# Run this to push your chatbot to GitHub

echo "🎭 Fluffy Bot / Cool Boy - Quick Deploy"
echo "========================================"
echo ""

# Color codes
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo -e "${RED}❌ Git is not installed. Please install git first.${NC}"
    exit 1
fi

echo -e "${BLUE}📋 Pre-deployment Checklist:${NC}"
echo ""

# Checklist
echo "✅ Files present:"
files=("index.html" "training-data.json" "README.md" "LICENSE" "CHANGELOG.md" "CONTRIBUTING.md" "CODE_OF_CONDUCT.md" "SECURITY.md" "QUICKSTART.md" "CONTRIBUTORS.md" ".gitignore")

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo -e "  ${GREEN}✓${NC} $file"
    else
        echo -e "  ${RED}✗${NC} $file (missing)"
    fi
done

echo ""
echo -e "${BLUE}🔧 Configuration needed:${NC}"
echo "  1. Replace 'yourusername' with your GitHub username in all files"
echo "  2. Replace 'your.email@example.com' with your actual email"
echo "  3. Update repository URL in documentation"
echo ""

read -p "Have you completed the configuration? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${RED}❌ Please complete configuration first${NC}"
    exit 1
fi

echo ""
echo -e "${BLUE}📦 Creating Git repository...${NC}"

# Initialize git if not already
if [ ! -d ".git" ]; then
    git init
    echo -e "${GREEN}✓${NC} Git initialized"
else
    echo -e "${GREEN}✓${NC} Git already initialized"
fi

# Add all files
git add .
echo -e "${GREEN}✓${NC} Files added to git"

# Commit
echo ""
read -p "Enter commit message (or press enter for default): " commit_msg
if [ -z "$commit_msg" ]; then
    commit_msg="Initial commit: Fluffy Bot / Cool Boy v2.0

- Dual personality chatbot (Fluffy Bot & Cool Boy)
- Learning & project tracking system
- Voice output with text-to-speech
- 400+ custom responses
- Complete documentation
- Built in 2 hours with Claude AI"
fi

git commit -m "$commit_msg"
echo -e "${GREEN}✓${NC} Changes committed"

# Remote setup
echo ""
echo -e "${BLUE}🌐 GitHub Repository Setup${NC}"
echo "Please create a new repository on GitHub:"
echo "  1. Go to https://github.com/new"
echo "  2. Name it: fluffy-cool-chatbot"
echo "  3. Don't initialize with README (we have one)"
echo "  4. Copy the repository URL"
echo ""
read -p "Enter your GitHub repository URL: " repo_url

if [ ! -z "$repo_url" ]; then
    git remote add origin "$repo_url"
    echo -e "${GREEN}✓${NC} Remote added"
    
    # Set main branch
    git branch -M main
    echo -e "${GREEN}✓${NC} Branch set to main"
    
    # Push
    echo ""
    echo -e "${BLUE}🚀 Pushing to GitHub...${NC}"
    git push -u origin main
    
    if [ $? -eq 0 ]; then
        echo ""
        echo -e "${GREEN}🎉 SUCCESS! Your chatbot is now on GitHub!${NC}"
        echo ""
        echo "📍 Repository: $repo_url"
        echo "🌐 Enable GitHub Pages:"
        echo "   Settings → Pages → Source: main branch → Save"
        echo ""
        echo "Your chatbot will be live at:"
        echo "   https://YOUR_USERNAME.github.io/fluffy-cool-chatbot/index.html"
        echo ""
        echo -e "${GREEN}✨ Next steps:${NC}"
        echo "   1. Enable GitHub Pages (see above)"
        echo "   2. Share your creation!"
        echo "   3. Star the repo ⭐"
        echo "   4. Build v2.1!"
    else
        echo -e "${RED}❌ Push failed. Please check your credentials and try again.${NC}"
    fi
else
    echo -e "${RED}❌ No repository URL provided${NC}"
    echo ""
    echo "You can push manually later with:"
    echo "  git remote add origin YOUR_REPO_URL"
    echo "  git branch -M main"
    echo "  git push -u origin main"
fi

echo ""
echo -e "${BLUE}📊 Repository Stats:${NC}"
echo "  • Build time: 2 hours"
echo "  • Total files: 15+"
echo "  • Lines of code: ~2,500"
echo "  • Dependencies: 0"
echo "  • Cost: $0"
echo ""
echo -e "${GREEN}Made with 💖 by makers, for makers${NC}"