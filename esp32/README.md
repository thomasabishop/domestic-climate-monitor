# esp32

C code programming ESP32 microcontroller (combined with SHT41 sensor) to measure temp and humidity
and publishing data over MQTT.

## Activate Expressif development environment

```sh
cd esp32
source "/home/thomasabishop/.espressif/tools/activate_idf_v6.0.sh"
```

## Compile

```sh
idf.py build
```

> On Fedora, ensure you are a member of `dialout` group with `usermod -a -G
dialout $USER`

## Flash to device and monitor

```sh
idf.py -p /dev/ttyUSBO flash && moniotr
```
