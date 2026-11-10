# Domestic Climate Monitor

ESP32-based system for monitoring temperature, humidity and CO2 levels in my
home.

## esp32/

C code programming ESP32 microcontroller (combined with SHT41 sensor) to measure temp and humidity
and publishing data over MQTT.

See dedicated README.

## mqtt-to-db/

Python program that subscribes to MQTT topics and inserts climate data into
SQLite database.

See dedicated README.

## mock_mqtt_publish.sh

Script for simulating runtime MQTT publishing. Pass in room to mock as
parameter, e.g.

```sh
./mock_mqtt_publish lounge
```

Example output:

```sh
mosquitto_sub -h 192.168.178.49 -p 1883 -d -t sensors/domestic/#

Client null received PUBLISH (d0, q0, r0, m0, 'sensors/domestic/lounge', ... (77 bytes))
{"temperature": 22.09, "humidity": 51.82, "timestamp": "2026-04-24T14:58:47"}
Client null received PUBLISH (d0, q0, r0, m0, 'sensors/domestic/lounge', ... (77 bytes))
{"temperature": 22.81, "humidity": 51.51, "timestamp": "2026-04-24T14:58:48"}
Client null received PUBLISH (d0, q0, r0, m0, 'sensors/domestic/lounge', ... (77 bytes))
```
