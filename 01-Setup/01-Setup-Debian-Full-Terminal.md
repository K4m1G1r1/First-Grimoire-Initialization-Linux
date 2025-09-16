# 01 – Debian Full Terminal Setup 🔥

## 1️⃣ Minimal Installation

- Download Debian 13 netinst ISO.
- Choose **Advanced options → Install without GUI**.
- Create user and add to sudo:

```bash
adduser yourusername
usermod -aG sudo yourusername
```

## 2️⃣ Set Mirrors

- Choose a country mirror (Japan for spiritual connection 😉).
- Official mirror example: `deb.debian.org`

## 3️⃣ Update & Upgrade

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install curl unzip zip git build-essential acpi -y
```

## 4️⃣ Terminal Tools

- Kitty terminal (optional, supports copy/paste in tty)
- Exit X server:

```bash
exit
```

## 5️⃣ Install Git & Connect to GitHub

```bash
sudo apt install git -y
git config --global user.name "Your Name"
git config --global user.email "youremail@example.com"
ssh-keygen -t ed25519 -C "youremail@example.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub  # Copy to GitHub SSH keys
ssh -T git@github.com       # Test connection
```

- Initialize local repository:

```bash
git init
git add .
git commit -m "Initial commit – First Grimoire K4m1G1r1"
git branch -M main
git remote add origin git@github.com:YOUR_USERNAME/First-Grimoire-Initialization-Linux.git
git push -u origin main
```
