# 02 – Flatpak Apps Installation 💀

## 1️⃣ Install Flatpak

```bash
sudo apt install flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

## 2️⃣ Install apps

```bash
flatpak install flathub org.telegram.desktop
flatpak install flathub com.visualstudio.code
flatpak install flathub com.spotify.Client
flatpak install flathub com.slack.Slack
flatpak install flathub com.discordapp.Discord
```

## 3️⃣ Run apps

```bash
flatpak run org.telegram.desktop
```

- Check app ID with `flatpak list`.
