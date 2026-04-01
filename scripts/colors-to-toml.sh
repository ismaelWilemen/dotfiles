#!/usr/bin/env bash

set -e

INPUT="$HOME/.cache/matugen/colors.css"
OUTPUT="$HOME/.config/alacritty/colors.toml"

# Função robusta
get_color() {
    sed -n "s/^\$$1:[[:space:]]*\(#[0-9a-fA-F]\{6\}\);/\1/p" "$INPUT" | sed 's/#/0x/'
}

# Debug (opcional, pode remover depois)
# echo "PRIMARY RAW:"
# cat "$INPUT"

background=$(get_color background)
foreground=$(get_color on_background)

black=$(get_color surface_container_lowest)
red=$(get_color on_error)
green=$(get_color tertiary)
yellow=$(get_color secondary)
blue=$(get_color primary)
magenta=$(get_color primary_container)
cyan=$(get_color secondary_container)
white=$(get_color on_surface)

# Bright
bright_black=$(get_color surface_container_highest)
bright_red=$(get_color on_error_container)
bright_green=$(get_color on_tertiary_container)
bright_yellow=$(get_color on_secondary_container)
bright_blue=$(get_color primary_fixed)
bright_magenta=$(get_color primary_fixed_dim)
bright_cyan=$(get_color secondary_fixed_dim)
bright_white="0xffffff"

# Verificação simples
if [ -z "$background" ]; then
    echo "Erro: não conseguiu ler o colors.css"
    echo "Arquivo:"
    cat "$INPUT"
    exit 1
fi

cat > "$OUTPUT" <<EOF
[colors]
draw_bold_text_with_bright_colors = true

[colors.primary]
background = "$background"
foreground = "$foreground"

[colors.normal]
black = "$black"
red = "$red"
green = "$green"
yellow = "$yellow"
blue = "$blue"
magenta = "$magenta"
cyan = "$cyan"
white = "$white"

[colors.bright]
black = "$bright_black"
red = "$bright_red"
green = "$bright_green"
yellow = "$bright_yellow"
blue = "$bright_blue"
magenta = "$bright_magenta"
cyan = "$bright_cyan"
white = "$bright_white"
EOF

echo "Gerado em $OUTPUT"
