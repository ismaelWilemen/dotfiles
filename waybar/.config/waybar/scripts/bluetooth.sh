#!/bin/bash

DEVICES=$(upower -e | grep -v -E "BAT|line_power|DisplayDevice")

OUTPUT=""
TOOLTIP=""

for DEVICE in $DEVICES; do
    INFO=$(upower -i "$DEVICE" 2>/dev/null)

    MODEL=$(echo "$INFO" | awk -F: '/model/ {print $2}' | xargs)
    PERCENT=$(echo "$INFO" | awk -F: '/percentage/ {gsub("%","",$2); gsub(" ","",$2); print $2}')
    RECHARGEABLE=$(echo "$INFO" | awk -F: '/rechargeable/ {print $2}' | xargs)

    [ -z "$MODEL" ] && MODEL="Unknown"

    # Detecta tipo
    case "$DEVICE" in
        *headset*) TYPE_ICON="" ;;
        *mouse*) TYPE_ICON="" ;;
        *keyboard*) TYPE_ICON="" ;;
        *phone*) TYPE_ICON="" ;;
        *) TYPE_ICON="" ;;
    esac

    # Ignora dispositivos sem bateria real
    if [ -z "$PERCENT" ] || [ "$RECHARGEABLE" = "no" ]; then
        OUTPUT+=" $TYPE_ICON  "
        TOOLTIP+="$TYPE_ICON  $MODEL\\n   ⚠ sem suporte a bateria\\n\\n"
        continue
    fi

    # Ícone de bateria
    if [ "$PERCENT" -ge 90 ]; then ICON="󰥈"
    elif [ "$PERCENT" -ge 80 ]; then ICON="󰥅"
    elif [ "$PERCENT" -ge 70 ]; then ICON="󰥄"
    elif [ "$PERCENT" -ge 60 ]; then ICON="󰥃"
    elif [ "$PERCENT" -ge 50 ]; then ICON="󰥂"
    elif [ "$PERCENT" -ge 40 ]; then ICON="󰥁"
    elif [ "$PERCENT" -ge 30 ]; then ICON="󰥀"
    elif [ "$PERCENT" -ge 20 ]; then ICON="󰤿"
    else ICON="󰤾"
    fi

    PERCENT_FORMATTED=$(printf "%3s" "${PERCENT}%")

    OUTPUT+="$TYPE_ICON $ICON  $PERCENT_FORMATTED  "

    # Tooltip bonito
    TOOLTIP+="$TYPE_ICON  $MODEL\\n"
    TOOLTIP+="   $ICON  ${PERCENT}%\\n\\n"
done

# Remove quebra de linha extra no final
TOOLTIP="${TOOLTIP%\\n\\n}"

# Se não tiver nada conectado
if [ -z "$OUTPUT" ]; then
    echo '{"text":"󰂲 ","class":"off"}'
    exit 0
fi

# Limpa caracteres problemáticos
OUTPUT=$(echo -n "$OUTPUT" | tr -d '\r')
TOOLTIP=$(echo -n "$TOOLTIP" | tr -d '\r')

# JSON final
printf '{"text":"%s","tooltip":"%s"}\n' "$OUTPUT" "$TOOLTIP"
