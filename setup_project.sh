#!/bin/bash
# Universal project setup script

set -e

echo "🔧 Setting up secure repository (universal)..."

# Detect OS
OS="$(uname -s)"
case "${OS}" in
    Linux*)     MACHINE=Linux;;
    Darwin*)    MACHINE=Mac;;
    *)          MACHINE="Windows";;
esac

echo "Detected OS: $MACHINE"

# Install pre-commit
if ! command -v pre-commit &> /dev/null; then
    echo "Installing pre-commit..."
    pip3 install pre-commit || pip install pre-commit
fi

# Install pre-commit hooks
echo "Installing git hooks..."
pre-commit install
pre-commit install --hook-type commit-msg

# Create .env.example
if [ ! -f .env.example ]; then
    echo "Creating .env.example..."
    cat > .env.example << 'EOF'
# Environment Variables Template
# Copy to .env and fill in your values
# NEVER commit .env file!

# API Keys
API_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
API_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Database
DB_CONNECTION_STRING=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

# Cloud Credentials
AZURE_CLIENT_ID=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx
AZURE_CLIENT_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
AWS_ACCESS_KEY_ID=xxxxxxxxxxxxxxxxxxxx
AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
EOF
fi

# Git configuration
echo "Configuring git..."
read -p "Enter your GitHub username: " github_user
git config user.email "${github_user}@users.noreply.github.com"

# Detect languages
echo ""
echo "Detecting project languages..."

if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    echo "  📦 Python detected"
    pip install pip-audit safety bandit 2>/dev/null || true
fi

if [ -f "package.json" ]; then
    echo "  📦 Node.js detected"
    npm install 2>/dev/null || true
fi

if ls *.ps1 &>/dev/null 2>&1; then
    echo "  📦 PowerShell detected"
    echo "     Install PSScriptAnalyzer: Install-Module -Name PSScriptAnalyzer"
fi

if [ -f "go.mod" ]; then
    echo "  📦 Go detected"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "1. Copy .env.example to .env and add credentials"
echo "2. Review SECURITY.md"
echo "3. Start coding securely!"