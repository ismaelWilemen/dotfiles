#!/usr/bin/env bash

SAVE_DIR="$HOME/Imagens/Screenshots"
mkdir -p "$SAVE_DIR"

notify() {
    notify-send -a "Screenshot" -i "$1" "$2" "$1" -t 3000
}

run_swappy() {
    # Monitora a pasta em background antes de abrir o swappy
    inotifywait -q -e close_write --format "%f" "$SAVE_DIR" &
    INOTIFY_PID=$!

    # Abre o swappy
    swappy -f -

    # Pega o arquivo criado (aguarda 1s no máximo)
    FILE=$(wait $INOTIFY_PID 2>/dev/null)

    if [[ -n "$FILE" ]]; then
        notify "$SAVE_DIR/$FILE" "Screenshot salva"
    else
        kill $INOTIFY_PID 2>/dev/null
    fi
}

case "$1" in
    full)
        grim - | run_swappy
        ;;
    area)
        GEOM=$(slurp 2>/dev/null) || exit 1
        grim -g "$GEOM" - | run_swappy
        ;;
    window)
        GEOM=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        grim -g "$GEOM" - | run_swappy
        ;;
    *)
        echo "Uso: screenshot.sh [full|area|window]"
        exit 1
        ;;
esac
