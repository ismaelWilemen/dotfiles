#!/bin/bash

IMAGE="$1"

if [ -z "$IMAGE" ]; then
    echo "Uso: wal_run.sh <imagem>"
    exit 1
fi

BACKENDS=("okthief" "colorz" "colorthief" "wal")

for backend in "${BACKENDS[@]}"; do
    echo "Tentando backend: $backend"
    wal --backend "$backend" -i "$IMAGE" -n 2>/dev/null
    if [ $? -eq 0 ]; then
        echo "Sucesso com: $backend"
        exit 0
    fi
done

echo "Todos os backends falharam"
exit 1
