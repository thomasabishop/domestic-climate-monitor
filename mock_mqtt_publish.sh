#!/bin/bash

# Mock MQTT messages sent from ESP32

MQTT_BROKER_IP="192.168.178.49"
MQTT_BROKER_PORT="1883"
MOCK_TEMP_DATA=("22.81" "22.62" "22.61" "22.49" "22.52" "21.97" "22.12" "22.09")
MOCK_HUM_DATA=("51.51" "51.22" "51.40" "52.25" "53.56" "52.81" "52.00" "51.82")
TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

declare -i i=0
while (( i<8 ))
	do 
		mosquitto_pub --host ${MQTT_BROKER_IP} --port ${MQTT_BROKER_PORT} --topic test_topic\
			--message "{\"temperature\": ${MOCK_TEMP_DATA[i]}, \"humidity\": ${MOCK_HUM_DATA[i]}, \"timestamp\": \"$(date +"%Y-%m-%dT%H:%M:%S")\"}"
		(( i++ ))
		sleep 1
		if ((i==8)); then
			echo "repeating loop"
			i=0
			continue
		fi
	done

