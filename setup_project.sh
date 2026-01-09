#!/bin/bash
# Universal Secure Project Setup Script
# Sets up pre-commit hooks, creates .env.example, and detects project languages

set -e  # Exit on error

echo "🔒 Setting up secure repository..."
echo ""

# ==============================================================================
# Detect Operating System
# ==============================================================================
OS="$(uname -s)"
case "${OS}" in
    Linux*)  MACHINE=Linux;;
    Darwin*) MACHINE=Mac;;
    *)       MACHINE="Windows";;
esac
echo "✓ Detected OS: $MACHINE"

# ==============================================================================
# Check Git Repository
# ==============================================================================
if [ ! -d .git ]; then
    echo "⚠️  Not a git repository. Initializing..."
    git init
    echo "✓ Git repository initialized"
fi

# ==============================================================================
# Install Pre-commit
# ==============================================================================
echo ""
echo "📦 Installing pre-commit hooks..."

if ! command -v pre-commit &> /dev/null; then
    echo "Installing pre-commit..."
    if command -v pip3 &> /dev/null; then
        pip3 install pre-commit
    elif command -v pip &> /dev/null; then
        pip install pre-commit
    else
        echo "❌ Error: pip not found. Please install Python and pip first."
        exit 1
    fi
fi

# Install git hooks
pre-commit install
pre-commit install --hook-type commit-msg
echo "✓ Pre-commit hooks installed"

# ==============================================================================
# Create .env.example Template
# ==============================================================================
if [ ! -f .env.example ]; then
    echo ""
    echo "📝 Creating .env.example template..."
    cat > .env.example << 'EOF'
# Environment Variables Template
# Copy this file to .env and fill in your actual values
# NEVER commit .env to git!

# ==============================================================================
# API Keys
# ==============================================================================
API_KEY=your_api_key_here
API_SECRET=your_api_secret_here

# ==============================================================================
# Database
# ==============================================================================
DATABASE_URL=postgresql://user:password@localhost:5432/dbname
DB_CONNECTION_STRING=your_connection_string_here

# ==============================================================================
# Cloud Credentials - Azure
# ==============================================================================
AZURE_CLIENT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
AZURE_CLIENT_SECRET=your_azure_secret_here
AZURE_TENANT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

# ==============================================================================
# Cloud Credentials - AWS
# ==============================================================================
AWS_ACCESS_KEY_ID=AKIAIOSFODNN7EXAMPLE
AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
AWS_DEFAULT_REGION=us-east-1

# ==============================================================================
# Cloud Credentials - GCP
# ==============================================================================
GOOGLE_APPLICATION_CREDENTIALS=/path/to/service-account-key.json
GCP_PROJECT_ID=your_project_id

# ==============================================================================
# GitHub
# ==============================================================================
GITHUB_TOKEN=ghp_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# ==============================================================================
# Application Settings
# ==============================================================================
ENVIRONMENT=development
DEBUG=true
LOG_LEVEL=INFO
PORT=8000
EOF
    echo "✓ .env.example created"
fi

# ==============================================================================
# Git Configuration
# ==============================================================================
echo ""
echo "⚙️  Configuring git..."

# Check if user.email is already set
if ! git config user.email &> /dev/null; then
    read -p "Enter your GitHub username: " github_user
    git config user.email "${github_user}@users.noreply.github.com"
    echo "✓ Git email configured: ${github_user}@users.noreply.github.com"
else
    echo "✓ Git email already configured: $(git config user.email)"
fi

# ==============================================================================
# Detect and Setup Project Languages
# ==============================================================================
echo ""
echo "🔍 Detecting project languages..."

LANGUAGES_FOUND=0

# Python
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ] || [ -f "setup.py" ]; then
    echo "  🐍 Python detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
    if command -v pip &> /dev/null || command -v pip3 &> /dev/null; then
        echo "     Installing Python security tools..."
        pip install pip-audit 2>/dev/null || pip3 install pip-audit 2>/dev/null || true
    fi
fi

# Node.js
if [ -f "package.json" ]; then
    echo "  📦 Node.js detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
    if command -v npm &> /dev/null; then
        echo "     Run 'npm install' to install dependencies"
    fi
fi

# Go
if [ -f "go.mod" ]; then
    echo "  🔷 Go detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
    if command -v go &> /dev/null; then
        echo "     Installing govulncheck..."
        go install golang.org/x/vuln/cmd/govulncheck@latest 2>/dev/null || true
    fi
fi

# Rust
if [ -f "Cargo.toml" ]; then
    echo "  🦀 Rust detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
    if command -v cargo &> /dev/null; then
        echo "     Installing cargo-audit..."
        cargo install cargo-audit 2>/dev/null || true
    fi
fi

# Docker
if [ -f "Dockerfile" ] || [ -f "docker-compose.yml" ]; then
    echo "  🐳 Docker detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
fi

# Terraform
if ls *.tf 1> /dev/null 2>&1; then
    echo "  🏗️  Terraform detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
fi

# PowerShell
if ls *.ps1 1> /dev/null 2>&1; then
    echo "  💻 PowerShell detected"
    LANGUAGES_FOUND=$((LANGUAGES_FOUND + 1))
    echo "     Install PSScriptAnalyzer: Install-Module -Name PSScriptAnalyzer"
fi

if [ $LANGUAGES_FOUND -eq 0 ]; then
    echo "  ℹ️  No language files detected yet - ready for any language!"
fi

# ==============================================================================
# Final Instructions
# ==============================================================================
echo ""
echo "=========================================="
echo "✅ Setup complete!"
echo "=========================================="
echo ""
echo "📋 Next Steps:"
echo ""
echo "1. 📝 Copy .env.example to .env and add your credentials:"
echo "   cp .env.example .env"
echo ""
echo "2. 🔒 Enable GitHub security features (Settings → Security):"
echo "   • Dependabot alerts"
echo "   • Dependabot security updates"
echo "   • Secret scanning"
echo "   • Push protection"
echo ""
echo "3. 🛡️  Configure branch protection (Settings → Branches):"
echo "   • Require pull request reviews"
echo "   • Require status checks to pass"
echo ""
echo "4. 📚 Review security documentation:"
echo "   • README.md - Getting started guide"
echo "   • SECURITY.md - Security policy"
echo ""
echo "5. 🚀 Start coding securely!"
echo "   git add ."
echo "   git commit -m 'Initial secure setup'"
echo ""
echo "=========================================="
echo "🔐 Your repository is now secure!"
echo "=========================================="
