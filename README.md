# First Grimoire = Initialization in Linux 🔥💀🖥️

Welcome to my **First Grimoire**. This guide documents the initialization of a full terminal Linux environment, installation of apps, VirtualBox labs, and steps to build a personal pentesting lab – K4m1G1r1 style.

## Objective

- Install Debian 13 Full Terminal
- Set up essential applications with Flatpak
- Configure VirtualBox + Vagrant + Metasploitable3
- Connect and manage Bluetooth devices from terminal
- Master tty and advanced terminal commands
- Document every step for personal and public use

## Prerequisites

- Debian 13 installed (minimal/full terminal)
- Internet connection
- User with sudo privileges
- CPU with virtualization support (AMD-V / VT-x)
- GitHub account (for pushing the Grimorio)

## Table of Contents

1. [01 – Setup Debian Full Terminal](01-Setup/01-Setup-Debian-Full-Terminal.md)
2. [02 – Flatpak Apps Installation](02-Apps/02-Flatpak-Apps.md)
3. [03 – VirtualBox, Vagrant & Metasploitable3](03-Virtualization/03-VirtualBox-Vagrant-Metasploitable3.md)
4. [04 – Bluetooth Configuration](04-Bluetooth/04-Bluetooth.md)
5. [05 – Terminal Advanced Commands](05-Terminal/05-Terminal-Advanced.md)
6. [06 – K4m1G1r1 Tips](06-Tips/06-Tips-K4m1G1r1.md)
7. [Scripts](scripts/)
8. [Resources](resources/)

## Dev workflow — Git & VS Code (Flatpak) 💻🔗

This short guide shows the exact commands and flow I use to edit the Grimorio in VS Code (installed as a Flatpak), use the integrated terminal, and push changes to GitHub from the console.

### 1) Open the project in VS Code (Flatpak)

From the project folder in your terminal:

```bash
cd ~/First-Grimoire-Initialization-Linux
flatpak run com.visualstudio.code .
```

### 2) Basic Git init (if not already done)

- If you haven't initialized the repo locally yet:

```bash
git init
git add .
git commit -m "Initial commit — First Grimoire"
git branch -M main
```

### 3) Create the remote repo on GitHub (one of two options)

Option A — via web UI (recommended for first time)

- Go to GitHub → New repository → name it `First-Grimoire-Initialization-Linux.`
- Do not initialize with README (to avoid merge conflicts).
- Copy the SSH repo URL (e.g. `<git@github.com>:YOUR_USER/First-Grimoire-Initialization-Linux.git`).

Option B — using GitHub CLI (optional)

- If you have `gh` installed:

```bash
gh repo create YOUR_USER/First-Grimoire-Initialization-Linux --public --source=. --remote=origin --push
```

### 4) Add remote and push

(Use the SSH URL you copied from GitHub)

```bash
git remote add origin git@github.com:YOUR_USER/First-Grimoire-Initialization-Linux.git
git push -u origin main
```

### 5) Everyday edit → commit → push workflow

Inside VS Code (or terminal), do:

```bash
# edit files in VS Code
git add -A
git commit -m "Describe what you changed (short and clear)"
git push
```

### 6) Pulling / synchronizing with remote

If someone else or another machine updated the repo:

```bash
git pull --rebase origin main
```

Use `--rebase` to keep a clean linear history. If conflicts appear, VS Code provides a GUI for resolving them.

### 7) Useful VS Code tips

- Integrated terminal: `Ctrl + ``
- Git GUI: Source Control pane (left bar) for quick staging/commits
- Recommended extensions: GitLens, Markdown All in One, Prettier, vscode-icons
- Markdown preview: `Ctrl + Shift + V` (or `Open Preview to the Side`)

### 8) .gitignore & final polish

Before pushing, add a .gitignore to avoid committing large binaries or local config:

```text
# Example 
*.gitignore
*.box
*.ova
*.vagrant/
*.idea/
*.vscode/
*.log
```

Commit the `.gitignore` before pushing big files.

### 9) If you hit auth problems

Make sure your SSH key is added to GitHub and the agent:

```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
ssh -T git@github.com
```

If you used HTTPS remote, either switch to SSH or use:

```bash
git remote set-url origin git@github.com:YOUR_USER/First-Grimoire-Initialization-Linux.git
```
