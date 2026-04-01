#!/bin/bash
alacritty \
  --class bonsai-screensaver,bonsai-screensaver \
  -o window.decorations=none \
  -e cbonsai -l -i &

BONSAI_PID=$!

# Fica aberto até receber sinal de kill
wait $BONSAI_PID
