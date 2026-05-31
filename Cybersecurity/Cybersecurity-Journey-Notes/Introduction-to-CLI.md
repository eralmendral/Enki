# Introduction to the Command Line Interface (CLI)

A text-based interface to interact with an operating system using commands instead of clicking icons.

## CLI vs GUI

| CLI | GUI |
|-----|-----|
| Text commands | Visual elements |
| Lower resource usage | Higher resource usage |
| Highly scriptable | Limited automation |
| Steeper learning curve | Easier to learn |
| More precise control | Less precise |

## Key Components

- **Shell**: Command interpreter (Bash, Zsh, PowerShell)
- **Command**: Instruction to perform a task (`ls`, `cd`, `mkdir`)
- **Arguments**: Additional info for commands (`grep "error" logfile.txt`)
- **Options/Flags**: Modify command behavior (`-l`, `--help`)
- **stdin/stdout/stderr**: Input, output, and error streams

## Accessing the CLI

- **Windows**: Command Prompt, PowerShell, or Windows Terminal
- **macOS**: Terminal (`/Applications/Utilities/`)
- **Linux**: Terminal emulator (GNOME Terminal, Konsole)

---

## Essential Commands

### Navigation

```bash
pwd                  # Print current directory
cd directory_name    # Change to directory
cd ..                # Go up one level
cd ~                 # Go to home directory
ls                   # List files
ls -l                # List with details
ls -a                # List including hidden files
```

### File & Directory Management

```bash
mkdir folder_name           # Create directory
mkdir -p path/to/folder     # Create nested directories
rmdir folder_name           # Remove empty directory
touch file.txt              # Create empty file
cp source dest              # Copy file
cp -r source_dir dest_dir   # Copy directory recursively
mv old_name new_name        # Rename/move file
rm file.txt                 # Delete file
rm -r folder                # Delete directory recursively
rm -rf folder               # Force delete (DANGEROUS!)
cat file.txt                # Display file contents
echo "text"                 # Print text
```

---

## Paths

**Absolute**: Full path from root (`/home/user/documents/file.txt`)

**Relative**: Path from current location
- `.` = current directory
- `..` = parent directory

---

## Redirection & Piping

### Redirection

```bash
command > file.txt      # Output to file (overwrite)
command >> file.txt     # Append output to file
command < file.txt      # Input from file
command 2> error.txt    # Redirect errors
command &> all.txt      # Redirect output and errors
```

### Piping

Send output of one command as input to another:

```bash
ls -l | grep ".txt"           # List files, filter for .txt
cat file.txt | wc -l          # Count lines in file
```

---

## Keyboard Shortcuts

| Shortcut | Action |
|----------|--------|
| `↑` / `↓` | Navigate command history |
| `Ctrl+C` | Cancel current command |
| `Ctrl+L` | Clear screen |
| `Ctrl+R` | Search command history |
| `Tab` | Autocomplete |
| `Ctrl+A` / `Ctrl+E` | Move to start/end of line |

---

## Getting Help

```bash
man command      # Full manual page
command --help   # Quick help summary
help command     # Help for shell built-ins
```

---

## Quick Reference Examples

```bash
# Create project structure
mkdir -p project/src project/docs
cd project

# Create and view files
touch src/main.py
echo "print('hello')" > src/main.py
cat src/main.py

# Copy and move
cp src/main.py src/backup.py
mv src/backup.py docs/

# Find text in files
grep "print" src/main.py

# Chain commands
ls -la | grep ".py" | wc -l    # Count Python files
```
