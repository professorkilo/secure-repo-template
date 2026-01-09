# 🔒 Universal Security Template

One security baseline for all your projects - Python, JavaScript, Go, Rust, Docker, Terraform, PowerShell, and more.

## 🛡️ Security Features

### Core Security (All Projects)
- ✅ **Dual Secret Scanning** - Gitleaks + TruffleHog with live verification
- ✅ **File Security** - Automatic detection of credential files
- ✅ **Dependabot** - Automated updates for 8 ecosystems
- ✅ **Dependency Auditing** - Vulnerability scanning per ecosystem
- ✅ **Pre-commit Hooks** - Local security scanning included
- ✅ **CodeQL Analysis** - Multi-language code vulnerability detection
- ✅ **Weekly Scans** - Scheduled security audits
- ✅ **Comprehensive .gitignore** - Protection for all languages

### Ecosystem-Specific Auditing
- **Python:** pip-audit for vulnerability scanning
- **Node.js:** npm audit for dependency security
- **Go:** govulncheck for Go modules
- **Rust:** cargo-audit for Cargo packages
- **Docker:** hadolint for Dockerfile security
- **Terraform:** tfsec for infrastructure security
- **PowerShell/NuGet:** dotnet package vulnerability scanning
- **GitHub Actions:** Dependabot monitoring

---

## 🚀 Quick Start

### Use This Template

1. Click **"Use this template"** button above
2. Name your new repository
3. Clone it locally:
   ```bash
   git clone https://github.com/YOUR-USERNAME/your-new-repo.git
   cd your-new-repo
   ```

4. Run setup script:
   ```bash
   ./setup_project.sh
   ```

5. **Enable Security Features** in Settings → Security:
   - ✅ Dependabot alerts
   - ✅ Dependabot security updates  
   - ✅ Secret scanning
   - ✅ Push protection

6. **Configure Branch Protection** in Settings → Branches → Add rule:
   - Branch name: `main`
   - ✅ Require pull request before merging
   - ✅ Require status checks to pass:
     - Secret Detection
     - File Security Checks
     - Dependency Security Audit
     - CodeQL
   - ✅ Require branches up to date

7. **Start coding securely!**

### Manual Setup

```bash
# Clone this template
git clone https://github.com/professorkilo/secure-repo-template.git my-project
cd my-project

# Run setup
./setup_project.sh

# Start coding securely!
```

### Add to Existing Repository

```bash
# In your existing project
cd your-project

# Download security workflows
curl -o .github/workflows/security-universal.yml \
  https://raw.githubusercontent.com/professorkilo/secure-repo-template/main/.github/workflows/security-universal.yml

curl -o .github/dependabot.yml \
  https://raw.githubusercontent.com/professorkilo/secure-repo-template/main/.github/dependabot.yml

curl -o .github/workflows/codeql-analysis.yml \
  https://raw.githubusercontent.com/professorkilo/secure-repo-template/main/.github/workflows/codeql-analysis.yml

# Commit
git add .github/
git commit -m "Add security scanning"
git push
```

8. # Create .env file
cp .env.example .env
# Edit .env with your credentials
---

## 📁 What's Included

```
secure-repo-template/
├── .github/
│   ├── workflows/
│   │   ├── security-universal.yml    # Core security scanning (all 8 ecosystems)
│   │   └── codeql-analysis.yml       # Code vulnerability analysis
│   └── dependabot.yml                # Automated dependency updates (8 ecosystems)
├── .gitignore                        # Universal ignore patterns
├── .pre-commit-config.yaml           # Local security hooks
├── LICENSE                           # MIT License
├── SECURITY.md                       # Security policy
├── setup_project.sh                  # One-command setup script
└── README.md                         # This file
```

---

## 🔒 Security Baseline

Every project created from this template automatically gets:

| Feature | Tool | Coverage |
|---------|------|----------|
| **Secret Detection** | Gitleaks + TruffleHog | 800+ secret types with live API verification |
| **Code Analysis** | CodeQL | Multi-language vulnerability detection |
| **File Security** | Custom script | Blocks .pem, .key, .env, certificates |
| **Dependency Audits** | Multiple tools | Python, Node.js, Go, Rust, Docker, Terraform, .NET |
| **Automated Updates** | Dependabot | 8 ecosystems, weekly schedule |
| **Pre-commit Hooks** | Multiple tools | Local scanning before commit |

---

## 🎯 Supported Ecosystems

Dependabot automatically monitors (only scans what exists in your repo):

| Ecosystem | Manifest Files | Security Tool |
|-----------|----------------|---------------|
| **GitHub Actions** | `.github/workflows/*.yml` | Dependabot |
| **Python** | requirements.txt, setup.py, pyproject.toml | pip-audit |
| **Node.js** | package.json, yarn.lock | npm audit |
| **Go** | go.mod, go.sum | govulncheck |
| **Rust** | Cargo.toml, Cargo.lock | cargo-audit |
| **Docker** | Dockerfile, docker-compose.yml | hadolint |
| **Terraform** | *.tf files | tfsec |
| **PowerShell/NuGet** | *.csproj, packages.config | dotnet |

**No configuration needed** - if the files exist, Dependabot and security tools scan them automatically!

---

## 💡 Best Practices

### Never Commit Secrets
```bash
# ❌ BAD
git add .env
git commit -m "Add config"

# ✅ GOOD - Use environment variables
export API_KEY="your-key"

# ✅ GOOD - Use GitHub Secrets in Actions
${{ secrets.API_KEY }}
```

### Keep Dependencies Updated
- ✅ Review Dependabot PRs weekly (arrive Mondays)
- ✅ Update to patched versions within 7 days
- ✅ Test before merging to production
- ✅ Pin versions with security constraints

### Use Pre-Commit Hooks
```bash
# Already included in template!
pre-commit install

# Test all files
pre-commit run --all-files
```

### Scan Regularly
- ✅ **Pre-commit** - Local hooks scan before commit
- ✅ **On Push** - GitHub Actions scan every push/PR
- ✅ **Weekly** - Scheduled scans run Sundays at midnight UTC
- ✅ **On Demand** - Manually trigger from Actions tab

---

## 📊 What Gets Scanned

| Asset | Tool | Frequency |
|-------|------|-----------|
| **Commit history** | Gitleaks + TruffleHog | Every push + Weekly |
| **Code vulnerabilities** | CodeQL | Every push + Weekly |
| **Credential files** | Custom script | Every push + Weekly |
| **Python deps** | pip-audit | Every push + Weekly |
| **Node.js deps** | npm audit | Every push + Weekly |
| **Go modules** | govulncheck | Every push + Weekly |
| **Rust deps** | cargo-audit | Every push + Weekly |
| **Docker configs** | hadolint | Every push + Weekly |
| **Terraform** | tfsec | Every push + Weekly |
| **.NET deps** | dotnet | Every push + Weekly |
| **GitHub Actions** | Dependabot | Weekly (Mondays) |

---

## 🔧 Customization

### Adjust Scan Frequency

Edit `.github/dependabot.yml`:
```yaml
schedule:
  interval: "daily"    # For high-security projects
  interval: "weekly"   # Recommended (default)
  interval: "monthly"  # For stable projects
```

### Add More Security Tools

Edit `.github/workflows/security-universal.yml` to add:
- **Semgrep** - Static analysis
- **Trivy** - Container/IaC scanning
- **Bandit** - Python security linting
- **gosec** - Go security checker

### Disable CodeQL (Optional)

If you want minimal setup without code analysis:
```bash
git rm .github/workflows/codeql-analysis.yml
git commit -m "Remove CodeQL for minimal setup"
```

---

## 📚 Documentation

- [SECURITY.md](SECURITY.md) - Security policy and vulnerability reporting
- [GitHub Security Best Practices](https://docs.github.com/en/code-security)
- [Dependabot Configuration](https://docs.github.com/en/code-security/dependabot)
- [CodeQL Documentation](https://codeql.github.com/docs/)

---

## 🚦 Workflow Status

![Security Scanning](https://github.com/professorkilo/secure-repo-template/workflows/Universal%20Security%20Scanning/badge.svg)
![CodeQL](https://github.com/professorkilo/secure-repo-template/workflows/CodeQL/badge.svg)

---

## ❓ FAQ

### General Questions

**Q: Will this work with private repositories?**  
A: Yes! All features work with private repos. GitHub Actions minutes may apply based on your plan.

**Q: What if I don't use Python/Node/Go/Rust?**  
A: Workflows automatically detect what you use. No manual configuration needed. Unused ecosystems are silently skipped.

**Q: Do I need to install anything locally?**  
A: Only if you want pre-commit hooks. Otherwise, everything runs in GitHub Actions automatically.

### Security Questions

**Q: What happens if a secret is found?**  
A: The workflow fails with exit code 183. You must:
1. Rotate/revoke the credential immediately
2. Remove from git history using `git filter-repo` or BFG Repo-Cleaner
3. Store properly in GitHub Secrets or a vault

**Q: How do I ignore false positives?**  
A: Add `# trufflehog:ignore` comment on the line with the false positive:
```python
test_key = "fake_key_12345"  # trufflehog:ignore
```

**Q: Are pre-commit hooks required?**  
A: No, they're optional. GitHub Actions will catch secrets even without pre-commit hooks, but local hooks catch issues earlier.

### Workflow Questions

**Q: Why did CodeQL fail on my new repo?**  
A: CodeQL needs actual code to analyze. It's normal for it to skip on empty repos. It will work once you add code.

**Q: Can I run workflows manually?**  
A: Yes! Go to Actions tab → Select workflow → Click "Run workflow" button.

**Q: How long do security scans take?**  
A: Typically 1-3 minutes for small repos, up to 10 minutes for large repos with many dependencies.

### Dependabot Questions

**Q: Why am I getting so many Dependabot PRs?**  
A: Dependency groups are enabled for Python and Node.js to reduce PR spam. If still too many, adjust `open-pull-requests-limit` in `dependabot.yml`.

**Q: Can Dependabot automatically merge updates?**  
A: Yes, but requires additional configuration. See [Dependabot auto-merge docs](https://docs.github.com/en/code-security/dependabot/working-with-dependabot/automating-dependabot-with-github-actions).

### Troubleshooting

**Q: Workflow failing with "permission denied"?**  
A: Check Settings → Actions → General → Workflow permissions. Set to "Read and write permissions".

**Q: Pre-commit hooks not working?**  
A: Make sure you ran `pre-commit install` in your local repo after cloning.

**Q: Getting rate limited by GitHub?**  
A: Add a GitHub token in Settings → Secrets → Actions → Add `GH_TOKEN` for higher rate limits.

---

## 📝 License

MIT License - Use freely for personal and commercial projects. See [LICENSE](LICENSE) file.

---

## 🔐 Reporting Security Issues

**Found a vulnerability in this template?**

See [SECURITY.md](SECURITY.md) for reporting instructions.

**⚠️ Do not open public issues for security vulnerabilities.**

---

## 🙏 Credits

Built with:
- [Gitleaks](https://github.com/gitleaks/gitleaks) - Fast secret scanning
- [TruffleHog](https://github.com/trufflesecurity/trufflehog) - Secret verification
- [CodeQL](https://codeql.github.com/) - Code vulnerability analysis
- [Dependabot](https://github.com/dependabot) - Dependency updates
- [GitHub Actions](https://github.com/features/actions) - CI/CD automation

---

## 🌟 Support This Project

If this template helped secure your projects:
- ⭐ Star this repository
- 🔄 Share with your team
- 📝 Contribute improvements
- 🐛 Report issues

---

**Template Version:** 1.0.0  
**Maintained by:** [professorkilo](https://github.com/professorkilo)  
**Last Updated:** January 2026

---

**Ready to secure your projects?** Click "Use this template" to get started! 🚀
