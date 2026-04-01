#!/usr/bin/env bash

INPUT="$HOME/.cache/matugen/colors.css"
OUTPUT="$HOME/.config/waybar/_colors.scss"

sed -E 's/@define-color ([a-zA-Z0-9_]+) (#[0-9a-fA-F]+);/\$\1: \2;/' "$INPUT" > "$OUTPUT"
