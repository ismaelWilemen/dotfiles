#!/usr/bin/env bash

SAVE_DIR="$HOME/Videos/Gravações"
mkdir -p "$SAVE_DIR"
PIDFILE="/tmp/wf-recorder.pid"

is_recording() {
    [[ -f "$PIDFILE" ]] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null
}

stop_recording() {
    pkill -x wf-recorder
    rm -f "$PIDFILE"
    notify-send -a "Gravação" -i "media-record" "Gravação finalizada" "Salvo em $SAVE_DIR" -t 4000
}

start_recording() {
    local FILE="$SAVE_DIR/$(date +%Y-%m-%d_%H-%M-%S).mp4"
    local AUDIO="alsa_output.pci-0000_00_1f.3.analog-stereo.monitor"
    local ARGS=(-f "$FILE" --audio="$AUDIO")

    [[ "$1" == "area" ]] && {
        local GEOM
        GEOM=$(slurp 2>/dev/null) || exit 1
        ARGS+=(-g "$GEOM")
    }

    wf-recorder "${ARGS[@]}" &
    echo $! > "$PIDFILE"
    notify-send -a "Gravação" -i "media-record" "Gravando..." \
        "$([ "$1" = area ] && echo "Área selecionada" || echo "Tela inteira") — pressione a bind novamente para parar" -t 4000
}

case "$1" in
    full)
        is_recording && stop_recording || start_recording full
        ;;
    area)
        is_recording && stop_recording || start_recording area
        ;;
    *)
        echo "Uso: screenrecord.sh [full|area]"
        exit 1
        ;;
esac
