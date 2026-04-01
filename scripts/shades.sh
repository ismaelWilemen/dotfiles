#!/bin/bash

primary=$(grep '^\$primary:' ~/.config/waybar/_colors.scss | grep -o '#[0-9a-fA-F]*')

python3 << EOF
import colorsys

def hex_to_rgb(h):
    h = h.lstrip('#')
    return tuple(int(h[i:i+2], 16)/255 for i in (0, 2, 4))

def rgb_to_hex(r, g, b):
    return '#{:02x}{:02x}{:02x}'.format(int(r*255), int(g*255), int(b*255))

def generate_shade(hex_color, lightness):
    r, g, b = hex_to_rgb(hex_color)
    h, s, l = colorsys.rgb_to_hls(r, g, b)
    r2, g2, b2 = colorsys.hls_to_rgb(h, lightness, s)
    return rgb_to_hex(r2, g2, b2)

primary = "$primary"
shades = {
    "p30": generate_shade(primary, 0.30),
    "p40": generate_shade(primary, 0.40),
    "p50": generate_shade(primary, 0.50),
    "p60": generate_shade(primary, 0.60),
    "p70": generate_shade(primary, 0.70),
    "p80": generate_shade(primary, 0.80),
    "p90": generate_shade(primary, 0.90),
    "p95": generate_shade(primary, 0.95),
}

import json
with open('/home/rakis/.cache/matugen/cava.json', 'w') as f:
    json.dump({"primary": shades}, f, indent=2)

print("Gerado com sucesso!")
EOF
