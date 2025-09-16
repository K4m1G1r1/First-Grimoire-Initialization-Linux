# 05 – Terminal Advanced ⚡

## 1️⃣ Battery Status

- Using **acpi** (recommended):

```bash
acpi             # Shows battery percentage and charging status
acpi -b          # Shows battery only
acpi -V          # Shows battery, AC adapter, and temperatures
```

- Real-time monitoring:

```bash
watch -n 30 acpi
```

- Alternative direct file method:

```bash
cat /sys/class/power_supply/BAT0/capacity
cat /sys/class/power_supply/BAT0/status
```

## 2️⃣ Terminal & System

- Exit X server: `exit`
- Reboot: `sudo reboot`
- Shutdown: `sudo shutdown now`
- Check loaded modules: `lsmod | grep kvm`
- Copy/paste in tty: use Kitty terminal
