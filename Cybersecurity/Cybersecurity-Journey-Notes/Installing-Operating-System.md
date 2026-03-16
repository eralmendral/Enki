# Installing and Configuring an Operating System

## Pre-Installation Preparation

### Hardware Requirements
- **CPU**: Check architecture compatibility (64-bit vs 32-bit)
- **RAM**: Meet recommended requirements (not just minimum)
- **Storage**: Ensure adequate space; SSDs preferred
- **BIOS/UEFI**: Configure to boot from installation media

### Essential Pre-Installation Steps
1. **Backup data** using external drive, cloud storage, or disk cloning (Clonezilla, Macrium Reflect)
2. **Create bootable USB** using Rufus (Windows) or `dd` (Linux)
3. **Gather information**: Product key, network credentials, partitioning plan

## Installation Process

1. **Boot from installation media** (press Del, F2, F12, or Esc during startup)
2. **Select language and keyboard layout**
3. **Choose installation type**:
   - Upgrade: Preserves files/settings
   - Custom (Clean Install): Fresh installation (recommended)
4. **Configure disk partitions**
5. **Complete initial setup**: User account, network, time zone, privacy settings
6. **Install drivers** from manufacturer websites
7. **Activate OS** with product key

### Disk Partitioning

**Partition Types**:
- **Single Partition**: Entire drive as one partition
- **Multiple Partitions**: Separate OS, applications, and user data
- **EFI System Partition (ESP)**: Required for UEFI systems
- **Swap Partition**: Linux virtual memory

**File Systems**:
| OS | File System |
|---------|-------------|
| Windows | NTFS |
| macOS | APFS |
| Linux | ext4 |

## Post-Installation Configuration

### Priority Tasks
1. **Install all updates** (security patches, bug fixes, drivers)
2. **Enable firewall** (Windows Firewall, iptables, firewalld)
3. **Install antivirus** software
4. **Enable disk encryption** (BitLocker, FileVault, LUKS)

### User Account Security
- Use strong, unique passwords
- Keep UAC enabled (Windows)
- Use standard accounts for daily tasks; admin only when needed

### Performance Optimization
- Disable unnecessary startup programs
- Run disk cleanup
- Defragment HDD (not needed for SSD)

---

## OS Installation Checklist

### Pre-Installation
- [ ] Verify hardware meets OS requirements
- [ ] Backup all important data
- [ ] Download OS ISO file
- [ ] Create bootable USB drive
- [ ] Note down product key/license
- [ ] Record network credentials (SSID, password)
- [ ] Plan partition layout

### During Installation
- [ ] Configure BIOS/UEFI boot order
- [ ] Select correct installation type (upgrade/clean)
- [ ] Create/format partitions correctly
- [ ] Create user account with strong password
- [ ] Configure network connection
- [ ] Set correct time zone

### Post-Installation
- [ ] Install all OS updates
- [ ] Install hardware drivers
- [ ] Activate operating system
- [ ] Enable firewall
- [ ] Install antivirus software
- [ ] Enable disk encryption
- [ ] Configure UAC/user permissions
- [ ] Disable unnecessary startup programs
- [ ] Install essential applications
- [ ] Create system restore point/backup
