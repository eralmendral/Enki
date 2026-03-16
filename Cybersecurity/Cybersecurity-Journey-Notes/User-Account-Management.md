# User Account Management and Security Basics

## User Account Types

| Type | Privileges | Use Case |
|------|------------|----------|
| **Administrator** | Full system control (install software, modify settings, manage users) | IT staff, system management |
| **Standard User** | Limited (run apps, modify own files, change own password) | Regular employees, students |
| **Guest** | Temporary, very limited access | Visitors, temporary users |

**User Account Control (UAC)**: Windows security feature that prompts for confirmation before administrative actions.

## Password Policies

- **Length**: Minimum 12 characters
- **Complexity**: Mix uppercase, lowercase, numbers, symbols
- **Expiration**: Change regularly (e.g., every 90 days)
- **MFA**: Use multi-factor authentication (password + verification code)

**Password Managers**: Tools like LastPass, 1Password, Bitwarden generate and store unique strong passwords.

## Permissions & Access Control

- **File Permissions**: Read, write, execute access per user/group
- **Directory Permissions**: List contents, create files, delete
- **ACLs**: Granular permissions for specific users/groups
- **RBAC**: Assign permissions based on organizational roles

## Security Best Practices

1. **Keep software updated** - Enable automatic updates
2. **Use antivirus** - Windows Defender, Norton, Bitdefender
3. **Enable firewall** - Block unauthorized network access
4. **Avoid phishing** - Don't click suspicious links or enter credentials on untrusted sites
5. **Encrypt data** - BitLocker (Windows), FileVault (macOS)

## Principle of Least Privilege

Grant users only the minimum access level required for their job duties. This limits damage from compromised accounts and malware.
