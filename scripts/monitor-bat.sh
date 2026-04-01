#!/bin/bash

notif_id=""

while true; do
    capacity=$(cat /sys/class/power_supply/BAT1/capacity)
    status=$(cat /sys/class/power_supply/BAT1/status)

if [ "$capacity" -le 5 ] && [ "$status" = "Discharging" ]; then
    if [ -z "$notif_id" ]; then
        notif_id=$(notify-send -p -u critical "Bateria crítica!" "${capacity}% — conecte o carregador AGORA")
    fi
elif [ "$capacity" -le 15 ] && [ "$status" = "Discharging" ]; then
    if [ -z "$notif_id" ]; then
        notif_id=$(notify-send -p -u critical "Bateria baixa" "${capacity}% restante — conecte o carregador")
    fi
else
    if [ -n "$notif_id" ]; then
        makoctl dismiss --id "$notif_id"
        notif_id=""
    fi
fi

    sleep 30
done
