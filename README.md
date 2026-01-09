# Universal Security Template

One security baseline for all potential programming languages - Python, PowerShell, Bash, KQL, JavaScript, Go, and more.

## 🛡️ Security Features

### Universal (All Languages)
- ✅ Secret scanning (Gitleaks, TruffleHog)
- ✅ Dependabot for 20+ ecosystems
- ✅ CodeQL multi-language analysis
- ✅ Pre-commit hooks
- ✅ Comprehensive .gitignore
- ✅ GitHub Actions security workflows

### Language-Specific Support
- **Python:** pip-audit, safety, bandit
- **PowerShell:** PSScriptAnalyzer
- **JavaScript:** npm audit, ESLint
- **Bash/Shell:** ShellCheck
- **Go:** gosec, govulncheck
- **KQL:** Secret scanning, validation

## 🚀 Quick Start

### Use This Template

1. Click **"Use this template"** button above
2. Name your new repository
3. Clone it locally
4. Run setup:
   ```bash
   ./setup_project.sh
   ```

### Manual Setup

```bash
# Clone this template
git clone https://github.com/professorkilo/secure-repo-template.git my-project
cd my-project

# Run setup
./setup_project.sh

# Create .env file
cp .env.example .env
# Edit .env with your credentials

# Start coding securely!
```

## 📁 What's Included

```
secure-repo-template/
├── .github/
│   ├── workflows/
│   │   ├── security-universal.yml  # Core security scanning
│   │   └── codeql-analysis.yml     # Multi-language code analysis
│   └── dependabot.yml              # 20+ ecosystem support
├── .gitignore                       # Universal patterns
├── .pre-commit-config.yaml          # Local security hooks
├── SECURITY.md                      # Security policy
├── setup_project.sh                 # One-command setup
└── README.md                        # This file
```

## 🔒 Security Baseline

Every project created from this template automatically gets:

| Feature | Description |
|---------|-------------|
| Secret Scanning | Blocks API keys, passwords, tokens |
| Dependency Updates | Automated security patches |
| Code Analysis | Finds vulnerabilities before deployment |
| Pre-commit Hooks | Prevents credential commits locally |
| Push Protection | Blocks secrets at commit time |

## 📚 Documentation

- [SECURITY.md](SECURITY.md) - Security policy and practices
- [GitHub Security Features](https://docs.github.com/en/code-security)
- [Dependabot Documentation](https://docs.github.com/en/code-security/dependabot)

## 🎯 Supported Ecosystems

Dependabot automatically monitors:
- Python (pip, poetry, pipenv)
- JavaScript (npm, yarn, pnpm)
- PowerShell (nuget)
- Go (gomod)
- Ruby (bundler)
- Docker (dockerfile)
- Terraform (terraform)
- GitHub Actions
- And 12+ more!

## 💡 Best Practices

### Never Commit Secrets
- Use `.env` files (git-ignored)
- Use environment variables
- Use secret management services

### Keep Dependencies Updated
- Review Dependabot PRs weekly
- Update to patched versions promptly
- Pin versions with security constraints

### Scan Regularly
- Pre-commit hooks scan locally
- GitHub Actions scan on push
- Weekly scheduled scans

## 📝 License

MIT License - See LICENSE file

## 🔐 Reporting Security Issues

See [SECURITY.md](SECURITY.md) for vulnerability reporting.

---

**Template maintained by:** professorkilo  
**Last updated:** January 2026