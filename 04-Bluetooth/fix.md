# 📝 Fix Bluetooth Intel AX200 en Debian 13

## Problema

- `bluetoothctl` mostraba:

```bash
no default controller available
```

```bash
Failed to set power on: org.bluez.Error.Failed
```

- El adaptador estaba en DOWN y no podía subir (Can't init device hci0: Operation not possible due to RF-kill (132)).

## Solución aplicada

### 1. Instalar firmware necesario

- Asegurarse de tener habilitado non-free-firmware en /etc/apt/sources.list y luego:

```bash
sudo apt update
sudo apt install firmware-iwlwifi firmware-misc-nonfree
```

- Esto instala el firmware de Intel para Wi-Fi/Bluetooth AX200.

### 2. Configurar bluetoothd en modo experimental

- BlueZ necesita --experimental para manejar bien algunas funciones en chips Intel modernos.

```bash
sudo mkdir -p /etc/systemd/system/bluetooth.service.d
cat <<'EOF' | sudo tee /etc/systemd/system/bluetooth.service.d/override.conf
[Service]
ExecStart=
ExecStart=/usr/libexec/bluetooth/bluetoothd --experimental
EOF

sudo systemctl daemon-reload
sudo systemctl restart bluetooth
```

- Verificar con:

```bash
ps -ef | grep '[b]luetoothd'
```

### 3. Desbloquear RFKill

- El chip aparecía bloqueado por software (Soft blocked: yes).

```bash
rfkill list
sudo rfkill unblock bluetooth (or all)
```

- Verificar que quede:

```bash
Soft blocked: no
Hard blocked: no
```

### 4. Levantar la interfaz HCI

```bash
sudo hciconfig hci0 up
hciconfig -a   # debería mostrar UP RUNNING
```

### 5. Usar bluetoothctl normalmente

```bash
bluetoothctl
power on
agent on
default-agent
scan on
pair XX:XX:XX:XX:XX:XX
trust XX:XX:XX:XX:XX:XX
connect XX:XX:XX:XX:XX:XX
scan off
```

### Extra (opcional)

- Para no tener que hacer `rfkill unblock` cada vez, crear un servicio systemd que lo ejecute al arranque:

```bash
sudo tee /etc/systemd/system/rfkill-unblock-bluetooth.service <<'EOF'
[Unit]
Description=Unblock Bluetooth at startup
After=bluetooth.service

[Service]
Type=oneshot
ExecStart=/usr/sbin/rfkill unblock bluetooth

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable rfkill-unblock-bluetooth.service
```
