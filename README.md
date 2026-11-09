# Universal Security Template

One security baseline for all projects - Python, JavaScript, Go, Rust, Docker, Terraform, PowerShell, and more.

## Security Features

### Core Security (All Projects)
- Dual Secret Scanning - Gitleaks + TruffleHog with live verification
- File Security - Automatic detection of credential files
- Dependabot - Automated updates for 8 ecosystems
- Dependency Auditing - Vulnerability scanning per ecosystem
- Pre-commit Hooks - Local security scanning included
- CodeQL Analysis - Multi-language code vulnerability detection
- Semgrep SAST - Static analysis across all languages
- OSSF Scorecard - Supply chain security posture scoring
- Weekly Scans - Scheduled security audits
- Comprehensive .gitignore - Protection for all languages

### Ecosystem-Specific Auditing
- **Python:** pip-audit
- **Node.js:** npm audit
- **Go:** govulncheck
- **Rust:** cargo-audit
- **Docker:** hadolint
- **Terraform:** tfsec
- **PowerShell/NuGet:** dotnet package vulnerability scanning
- **GitHub Actions:** Dependabot monitoring

---

## Expected Template Behavior

This is a **template repository** with no source code. The following behaviors are expected.

### GitHub Actions
- **CodeQL Analysis**: All language jobs (Python, Go, JavaScript, Ruby) will skip cleanly with "no source files found" messages. When you add code, CodeQL will automatically analyze it.
- **Dependabot**: Will show errors for ecosystems without manifest files (e.g., "Cargo.toml not found"). Once you add the relevant file, Dependabot will start monitoring automatically.

These are **not failures** - the workflows handle missing code gracefully for template repositories.

### When You Create a Repo from This Template
1. Add your source code
2. Workflows automatically detect the languages present
3. Security scanning begins immediately
4. Dependabot starts monitoring your dependency files

---

## Quick Start

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

5. **Enable Security Features** in Settings > Security:
   - Dependabot alerts
   - Dependabot security updates
   - Secret scanning
   - Push protection

6. **Configure Branch Protection** in Settings > Branches > Add rule:
   - Branch name: `main`
   - Require pull request before merging
   - Require status checks to pass: Secret Detection, File Security Checks, Dependency Security Audit, CodeQL
   - Require branches up to date

7. Start coding.

### Add to Existing Repository

```bash
cd your-project

curl -o .github/workflows/security-universal.yml \
  https://raw.githubusercontent.com/professorkilo/secure-repo-template/main/.github/workflows/security-universal.yml

curl -o .github/dependabot.yml \
  https://raw.githubusercontent.com/professorkilo/secure-repo-template/main/.github/dependabot.yml

curl -o .github/workflows/codeql-analysis.yml \
  https://raw.githubusercontent.com/professorkilo/secure-repo-template/main/.github/workflows/codeql-analysis.yml

git add .github/
git commit -m "Add security scanning"
git push
```

---

## What's Included

```
secure-repo-template/
├── .github/
│   ├── workflows/
│   │   ├── security-universal.yml    # Core security scanning (all 8 ecosystems)
│   │   ├── codeql-analysis.yml       # Code vulnerability analysis
│   │   └── scorecard.yml             # OSSF supply chain security scoring
│   ├── CODEOWNERS                    # Code review enforcement
│   └── pull_request_template.md      # PR security checklist
├── .gitignore                        # Universal ignore patterns
├── .pre-commit-config.yaml           # Local security hooks
├── LICENSE                           # MIT License
├── SECURITY.md                       # Security policy
├── setup_project.sh                  # One-command setup script
└── README.md                         # This file
```

---

## Security Baseline

Every project created from this template automatically gets:

| Feature | Tool | Coverage |
|---------|------|----------|
| Secret Detection | Gitleaks + TruffleHog | 800+ secret types with live API verification |
| Code Analysis | CodeQL | Multi-language vulnerability detection |
| Static Analysis | Semgrep | OWASP, security-audit, and language-specific rulesets |
| Supply Chain | OSSF Scorecard | 18 security checks, weekly scoring |
| File Security | Custom script | Blocks .pem, .key, .env, certificates |
| Dependency Audits | Multiple tools | Python, Node.js, Go, Rust, Docker, Terraform, .NET |
| Automated Updates | Dependabot | 8 ecosystems, weekly schedule |
| Pre-commit Hooks | Multiple tools | Local scanning before commit |

---

## Supported Ecosystems

| Ecosystem | Manifest Files | Security Tool |
|-----------|----------------|---------------|
| GitHub Actions | `.github/workflows/*.yml` | Dependabot |
| Python | requirements.txt, setup.py, pyproject.toml | pip-audit |
| Node.js | package.json, yarn.lock | npm audit |
| Go | go.mod, go.sum | govulncheck |
| Rust | Cargo.toml, Cargo.lock | cargo-audit |
| Docker | Dockerfile, docker-compose.yml | hadolint |
| Terraform | *.tf files | tfsec |
| PowerShell/NuGet | *.csproj, packages.config | dotnet |

No configuration needed - if the files exist, Dependabot and security tools scan them automatically.

---

## Best Practices

### Never Commit Secrets
```bash
# BAD
git add .env
git commit -m "Add config"

# GOOD - Use environment variables
export API_KEY="your-key"

# GOOD - Use GitHub Secrets in Actions
${{ secrets.API_KEY }}
```

### Keep Dependencies Updated
- Review Dependabot PRs weekly (arrive Mondays)
- Update to patched versions within 7 days
- Test before merging to production
- Pin versions with security constraints

### Use Pre-Commit Hooks
```bash
pre-commit install
pre-commit run --all-files
```

### Scan Regularly
- **Pre-commit** - Local hooks scan before commit
- **On Push** - GitHub Actions scan every push/PR
- **Weekly** - Scheduled scans run Sundays at midnight UTC
- **On Demand** - Manually trigger from Actions tab

---

## What Gets Scanned

| Asset | Tool | Frequency |
|-------|------|-----------|
| Commit history | Gitleaks + TruffleHog | Every push + Weekly |
| Code vulnerabilities | CodeQL | Every push + Weekly |
| Static analysis | Semgrep | Every push + Weekly |
| Supply chain posture | OSSF Scorecard | Every push to main + Weekly |
| Credential files | Custom script | Every push + Weekly |
| Python deps | pip-audit | Every push + Weekly |
| Node.js deps | npm audit | Every push + Weekly |
| Go modules | govulncheck | Every push + Weekly |
| Rust deps | cargo-audit | Every push + Weekly |
| Docker configs | hadolint | Every push + Weekly |
| Terraform | tfsec | Every push + Weekly |
| .NET deps | dotnet | Every push + Weekly |
| GitHub Actions | Dependabot | Weekly (Mondays) |

---

## Customization

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
- **Trivy** - Container and IaC scanning
- **Bandit** - Python security linting
- **gosec** - Go security checker

### Disable CodeQL (Optional)

```bash
git rm .github/workflows/codeql-analysis.yml
git commit -m "Remove CodeQL for minimal setup"
```

---

## Documentation

- [SECURITY.md](SECURITY.md) - Security policy and vulnerability reporting
- [GitHub Security Best Practices](https://docs.github.com/en/code-security)
- [Dependabot Configuration](https://docs.github.com/en/code-security/dependabot)
- [CodeQL Documentation](https://codeql.github.com/docs/)
- [OSSF Scorecard](https://github.com/ossf/scorecard)
- [Semgrep Rules](https://semgrep.dev/r)

---

## Workflow Status

![Security Scanning](https://github.com/professorkilo/secure-repo-template/workflows/Universal%20Security%20Scanning/badge.svg)
![CodeQL](https://github.com/professorkilo/secure-repo-template/workflows/CodeQL/badge.svg)

---

## FAQ

**Q: Will this work with private repositories?**
A: Yes. All features work with private repos. GitHub Actions minutes may apply based on your plan. OSSF Scorecard `publish_results` requires a public repo; set it to `false` for private repos.

**Q: What if I don't use Python/Node/Go/Rust?**
A: Workflows automatically detect what you use. Unused ecosystems are silently skipped.

**Q: Do I need to install anything locally?**
A: Only if you want pre-commit hooks. Everything else runs in GitHub Actions automatically.

**Q: What happens if a secret is found?**
A: The workflow fails with a non-zero exit code. Rotate or revoke the credential immediately, remove it from git history using `git filter-repo`, and store it in GitHub Secrets or a vault.

**Q: How do I ignore false positives?**
A: Add `# trufflehog:ignore` on the line with the false positive:
```python
test_key = "fake_key_12345"  # trufflehog:ignore
```

**Q: Why did CodeQL fail on my new repo?**
A: CodeQL needs actual code to analyze. It will skip on empty or template repos and work once you add source files.

**Q: Can I run workflows manually?**
A: Yes. Go to Actions tab > select workflow > click "Run workflow".

**Q: Why am I getting many Dependabot PRs?**
A: Dependency groups are enabled for Python and Node.js to reduce PR volume. If still too many, reduce `open-pull-requests-limit` in `dependabot.yml`.

**Q: Workflow failing with "permission denied"?**
A: Check Settings > Actions > General > Workflow permissions. Set to "Read and write permissions".

---

## License

MIT License - Use freely for personal and commercial projects. See [LICENSE](LICENSE).

---

## Reporting Security Issues

Found a vulnerability in this template? See [SECURITY.md](SECURITY.md) for reporting instructions.

Do not open public issues for security vulnerabilities.

---

## Credits

- [Gitleaks](https://github.com/gitleaks/gitleaks) - Fast secret scanning
- [TruffleHog](https://github.com/trufflesecurity/trufflehog) - Secret verification
- [CodeQL](https://codeql.github.com/) - Code vulnerability analysis
- [Semgrep](https://semgrep.dev) - Static analysis
- [OSSF Scorecard](https://github.com/ossf/scorecard) - Supply chain security
- [Dependabot](https://github.com/dependabot) - Dependency updates
- [GitHub Actions](https://github.com/features/actions) - CI/CD automation

---

**Template Version:** 2.0.0
**Maintained by:** [professorkilo](https://github.com/professorkilo)
**Last Updated:** November 2026
