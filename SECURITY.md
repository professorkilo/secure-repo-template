# Security Policy

## Reporting a Vulnerability

If you discover a security vulnerability in this template:

### Preferred Method: GitHub Security Advisories
1. Go to the [Security](../../security) tab
2. Click "Report a vulnerability"
3. Fill out the advisory form with details

### Alternative: Private Disclosure
Contact via GitHub: [professorkilo](https://github.com/professorkilo)

**Please include:**
- Description of the vulnerability
- Steps to reproduce
- Potential impact
- Suggested fix (if available)

**Do not open a public issue for security vulnerabilities.**
**Do not disclose vulnerabilities publicly until patched.**

We will acknowledge receipt within 48 hours and provide updates every 7 days until resolved.

---

## Supported Versions

| Version | Supported | Notes |
|---------|-----------|-------|
| 2.x | Yes | Current stable version |
| 1.x | No | Superseded by 2.x |
| < 1.0 | No | Pre-release |

---

## Security Features

### Secret Protection
- Gitleaks - Fast pattern-based secret detection
- TruffleHog - Live API verification of secrets
- Push Protection - Blocks secrets at commit time (when enabled)
- Pre-commit Hooks - Local scanning before commit

### Dependency Security
- Dependabot - Automated updates for 8 ecosystems
- pip-audit - Python vulnerability scanning
- npm audit - Node.js security checks
- govulncheck - Go module vulnerabilities
- cargo-audit - Rust dependency scanning

### Code Security
- CodeQL - Multi-language code analysis
- Semgrep - Static analysis (OWASP + language-specific rules)
- hadolint - Dockerfile security linting
- tfsec - Terraform security scanning
- Weekly Scans - Automated security audits

### Supply Chain Security
- OSSF Scorecard - 18 security checks, weekly scoring published to Security tab
- SHA-pinned Actions - All workflow actions pinned to commit SHAs, not floating tags
- Checksum-verified installers - Binary tools verified against published checksums before execution

### File Security
- Credential Detection - Blocks .pem, .key, .env files
- Comprehensive .gitignore - Prevents accidental commits

---

## Security Practices

### Never Commit Secrets
```bash
# Never do this
git add .env
git add config/secrets.json

# Do this instead - add to .gitignore (already included)
# Use environment variables
export API_KEY="your-key"

# Use GitHub Secrets in workflows
${{ secrets.API_KEY }}
```

### Keep Dependencies Updated
- Review Dependabot PRs within 7 days
- Test updates before merging
- Enable auto-merge for patch updates (optional)

### Enable GitHub Security Features
Go to Settings > Security:
- Dependabot alerts
- Dependabot security updates
- Secret scanning
- Push protection

### Configure Branch Protection
- Require PR reviews
- Require status checks to pass
- Require branches to be up to date

---

## Supported Ecosystems

| Ecosystem | Tools |
|-----------|-------|
| Python | pip-audit, Dependabot |
| Node.js | npm audit, Dependabot |
| Go | govulncheck, Dependabot |
| Rust | cargo-audit, Dependabot |
| Docker | hadolint, Dependabot |
| Terraform | tfsec, Dependabot |
| PowerShell/.NET | dotnet, Dependabot |
| GitHub Actions | Dependabot |

---

## Security Checklist

### For New Projects

- [ ] Enable GitHub security features (Settings > Security)
- [ ] Configure branch protection for `main` branch
- [ ] Review and customize `.gitignore`
- [ ] Install pre-commit hooks (`pre-commit install`)
- [ ] Add repository secrets (never commit them)
- [ ] Review first security scan results
- [ ] Set up security contact in `SECURITY.md`
- [ ] Test workflows run successfully

### Regular Maintenance

- [ ] Review Dependabot PRs weekly
- [ ] Check Security tab for alerts
- [ ] Update dependencies within 7 days of security advisories
- [ ] Review workflow logs for failures
- [ ] Audit access permissions quarterly
- [ ] Review and rotate credentials annually

---

## Incident Response

If secrets are committed:

1. **Immediate Actions**
   - Rotate or revoke the exposed credential
   - Remove from git history: `git filter-repo --path <file> --invert-paths`
   - Force push: `git push --force`

2. **Verify Removal**
   - Check all branches
   - Check all tags
   - Check all PRs and forks

3. **Prevention**
   - Enable push protection
   - Install pre-commit hooks
   - Review `.gitignore` patterns

---

## Resources

- [GitHub Security Best Practices](https://docs.github.com/en/code-security)
- [Dependabot Documentation](https://docs.github.com/en/code-security/dependabot)
- [CodeQL Documentation](https://codeql.github.com/docs/)
- [OWASP Secure Coding Practices](https://owasp.org/www-project-secure-coding-practices-quick-reference-guide/)
- [OSSF Scorecard](https://github.com/ossf/scorecard)
- [Semgrep Rules](https://semgrep.dev/r)

---

## Contact

**Security Issues:** GitHub Security Advisories (preferred)
**General Questions:** Open a [Discussion](../../discussions)
**Template Maintainer:** [professorkilo](https://github.com/professorkilo)

---

## Disclosure Policy

- Responsible disclosure practices apply
- Security vulnerabilities are fixed privately
- Public disclosure follows patch availability
- Credit given to reporters unless anonymous disclosure requested

---

**Last Updated:** November 2026
**Security Contact:** GitHub Security Advisories (recommended)
