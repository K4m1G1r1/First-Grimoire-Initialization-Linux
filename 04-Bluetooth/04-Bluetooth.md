# 04 – Bluetooth Setup 🎧

## 1️⃣ Using bluetoothctl

```bash
bluetoothctl
scan on
# wait for device
scan off
pair XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
exit
# If any error occurs with pair, then again
scan on
pair XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
scan off
exit
```

- `scan off` stops continuous scanning.
- `trust` ensures auto-connect later.
