# Domestic Climate Monitor

ESP32-based system for monitoring temperature, humidity and CO2 levels in my
home.

## esp32/

C code programming ESP32 microcontroller (combined with SHT41 sensor) to measure temp and humidity
and publishing data over MQTT.

See dedicated README.

## mqtt-db-interface/

Python program that subscribes to MQTT topics and inserts climate data into
SQLite database.

See dedicated README.

## mock_mqtt_publish.sh

Script for simulating runtime MQTT publishing.

```sh
./mock_mqtt_publish
```

Example output:

```
Client null received PUBLISH (d0, q0, r0, m0, 'test_topic', ... (77 bytes))
{"temperature": 22.81, "humidity": 51.51, "timestamp": "2026-04-24T11:16:49"}
Client null received PUBLISH (d0, q0, r0, m0, 'test_topic', ... (77 bytes))
{"temperature": 22.62, "humidity": 51.22, "timestamp": "2026-04-24T11:16:50"}
Client null received PUBLISH (d0, q0, r0, m0, 'test_topic', ... (77 bytes))
{"temperature": 22.61, "humidity": 51.40, "timestamp": "2026-04-24T11:16:51"}
```

## Useful code

```
mosquitto_sub -h 192.168.178.49 -p 1883 -d -t test_topic
```
