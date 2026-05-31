# File System Management

A file system organizes and stores data on storage devices (hard drives, SSDs, USB drives), providing a logical structure for the OS to locate and access files.

## Key Functions

- **Naming** - assign identifiers to files and directories
- **Organization** - arrange files in a hierarchical structure
- **Access Control** - manage permissions
- **Metadata Management** - track size, creation date, modification date
- **Storage Allocation** - allocate space on the device
- **Data Integrity** - ensure data is stored correctly and protected from corruption

## File Formats

- **Text Files** - contain text decoded using character encoding (ASCII)
- **Wave Files** - store audio with header metadata (bit rate, stereo) followed by amplitude values
- **Bitmap Files** - store images as RGB pixel values with metadata for width, height, color depth

## Types of File Systems

| File System | OS | Max File Size | Features | Example Use |
|-------------|-----|---------------|----------|-------------|
| **FAT32** | Cross-platform | 4GB | Wide compatibility, no security features | USB drives, small SD cards |
| **NTFS** | Windows | 16EB | Journaling, file permissions, encryption | Windows internal drives |
| **exFAT** | Cross-platform | 16EB | FAT32 successor, large file support | Large USB drives, SD cards 64GB+ |
| **HFS+** | macOS (legacy) | 8EB | Journaling, file compression | Older macOS systems |
| **APFS** | macOS/iOS | 8EB | SSD-optimized, encryption, copy-on-write | Modern Apple devices |
| **ext4** | Linux | 16TB | Journaling, stable, performant | Linux servers and desktops |

**Example:** For a 2TB external drive storing large video files: FAT32 won't work (4GB limit), NTFS works for Windows-only use, exFAT is best for cross-platform compatibility.

## Hierarchical Directory Structure

Files are organized in a tree structure with directories (folders) containing files and subdirectories.

- **Root Directory** - top-level directory (`C:\` on Windows, `/` on Linux/macOS)
- **Subdirectory** - a directory within another directory
- **Path** - string specifying file/directory location

### Path Types

| Type | Description | Windows Example | Linux/macOS Example |
|------|-------------|-----------------|---------------------|
| **Absolute** | Full path from root | `C:\Users\John\Documents\file.txt` | `/home/john/Documents/file.txt` |
| **Relative** | Path from current directory | `Documents\file.txt` or `..\file.txt` | `Documents/file.txt` or `../file.txt` |

**Example:** Music library structure: `Music/Queen/A Night at the Opera/Bohemian Rhapsody.mp3`

## File Storage

- Files are stored in **blocks** on the storage device
- **Directory files** track: names, extensions, dates, ownership, permissions, location, length
- **Fragmentation** - files split across non-contiguous blocks, slowing access
- **Defragmentation** - reorganizes data so file blocks are contiguous

## File System Navigation

### GUI Navigation (File Explorer / Finder)

- Double-click directories to open
- Use address bar to type paths directly
- Back/Forward buttons for navigation history
- Navigation pane for quick directory access

### CLI Navigation

| Command | Windows | Linux/macOS | Description |
|---------|---------|-------------|-------------|
| List files | `dir` | `ls` | Show directory contents |
| Change directory | `cd folder` | `cd folder` | Enter a directory |
| Go up one level | `cd ..` | `cd ..` | Move to parent directory |
| Go to root | `cd C:\` | `cd /` | Navigate to root |
| Print location | N/A | `pwd` | Show current path |

**Example:** In Linux, from `/home/user`: `cd Documents` → `ls` → `cd ..` → `pwd`

## File and Directory Operations

| Operation | Windows CLI | Linux/macOS CLI |
|-----------|-------------|-----------------|
| Create directory | `md dirname` | `mkdir dirname` |
| Create empty file | N/A | `touch filename` |
| Delete file | `del filename` | `rm filename` |
| Delete directory | `rd dirname` | `rmdir dirname` |
| Move/Rename | `move src dest` | `mv src dest` |
| Copy file | `copy src dest` | `cp src dest` |
| Copy directory | `xcopy /s src dest` | `cp -r src dest` |

**Example:** Create project and copy: `mkdir MyProject` → `touch MyProject/readme.txt` → `cp -r MyProject /backup/`

## File Attributes and Permissions

### Attributes

- **Read-only** - prevents modification
- **Hidden** - invisible in standard listings
- **Archive** - modified since last backup
- **System** - critical system file

### Permissions (Linux/macOS)

| Permission | Symbol | Value | Description |
|------------|--------|-------|-------------|
| Read | r | 4 | View file contents |
| Write | w | 2 | Modify file |
| Execute | x | 1 | Run as program |

Permissions apply to three categories: **Owner**, **Group**, **Others**

**Example:** `rwxr-xr--` (754) means:
- Owner: read, write, execute (7)
- Group: read, execute (5)
- Others: read only (4)

**Commands:**
- `chmod 755 filename` - set permissions
- `chmod +x script.sh` - add execute permission

---

## Review Checklist

### File Systems
- [ ] Define what a file system is and its purpose
- [ ] List the six key functions of a file system
- [ ] Compare FAT32, NTFS, exFAT, APFS, and ext4
- [ ] Explain when to use each file system type

### Directory Structure
- [ ] Explain hierarchical directory structure
- [ ] Define root directory, subdirectory, and path
- [ ] Differentiate between absolute and relative paths
- [ ] Write example paths for both Windows and Linux/macOS

### Storage Concepts
- [ ] Explain how files are stored in blocks
- [ ] Define fragmentation and defragmentation
- [ ] Describe what information directory files track

### Navigation
- [ ] Navigate using GUI (File Explorer/Finder)
- [ ] Use CLI commands: `cd`, `ls`/`dir`, `pwd`
- [ ] Navigate using absolute and relative paths

### File Operations
- [ ] Create, delete, rename files and directories (GUI and CLI)
- [ ] Move and copy files using CLI commands
- [ ] Use recursive copy (`cp -r`) for directories

### Permissions
- [ ] List file attributes (read-only, hidden, archive, system)
- [ ] Explain read, write, execute permissions
- [ ] Interpret permission notation (e.g., `rwxr-xr--` = 754)
- [ ] Use `chmod` to modify permissions
