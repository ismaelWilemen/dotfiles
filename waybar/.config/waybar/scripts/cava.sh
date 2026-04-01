#!/usr/bin/env bash

bar="▁▂▃▄▅▆▇█"

# sed mapping
dict="s/;//g;"
for ((i=0; i<${#bar}; i++)); do
    dict="${dict}s/$i/${bar:$i:1}/g;"
done

cava_json="$HOME/.cache/matugen/cava.json"

c1=$(jq -r '.primary.p30' "$cava_json")
c2=$(jq -r '.primary.p40' "$cava_json")
c3=$(jq -r '.primary.p50' "$cava_json")
c4=$(jq -r '.primary.p60' "$cava_json")
c5=$(jq -r '.primary.p70' "$cava_json")
c6=$(jq -r '.primary.p80' "$cava_json")
c7=$(jq -r '.primary.p90' "$cava_json")
c8=$(jq -r '.primary.p95' "$cava_json")

# awk colorizer (MUITO mais rápido)
colorize() {
    awk -v c1="$c1" -v c2="$c2" -v c3="$c3" -v c4="$c4" \
        -v c5="$c5" -v c6="$c6" -v c7="$c7" -v c8="$c8" '
    {
        out=""
        for(i=1;i<=length($0);i++){
            ch=substr($0,i,1)
            if(ch=="▁") col=c1
            else if(ch=="▂") col=c2
            else if(ch=="▃") col=c3
            else if(ch=="▄") col=c4
            else if(ch=="▅") col=c5
            else if(ch=="▆") col=c6
            else if(ch=="▇") col=c7
            else if(ch=="█") col=c8

            out=out "<span foreground='\''" col "'\''>" ch "</span>"
        }
        print out
    }'
}

generate_random() {
    local result=""
    for ((i=0; i<24; i++)); do
        result+="${bar:RANDOM%8:1}"
    done
    echo "$result"
}

# cava config
config_file="/tmp/waybar_cava_config"
cat > "$config_file" <<EOF
[general]
bars = 24
framerate = 60
[output]
method = raw
raw_target = /dev/stdout
data_format = ascii
ascii_max_range = 7
EOF

silent_threshold=150
silent_count=0
is_silent=true
silent_pattern=""

# transição
last_output=""
transition_frames=3
transition_step=0

silent_bar="▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"

cava -p "$config_file" | while read -r line; do
    converted=$(sed "$dict" <<< "$line")

    if [[ "$converted" == "$silent_bar" ]]; then
        ((silent_count++))

        if ((silent_count >= silent_threshold)); then
            if [[ "$is_silent" == false || -z "$silent_pattern" ]]; then
                silent_pattern=$(generate_random)
                is_silent=true
            fi
            output="$silent_pattern"
        else
            output="$converted"
        fi
    else
        if [[ "$is_silent" == true ]]; then
            transition_step=$transition_frames
        fi

        silent_count=0
        is_silent=false
        output="$converted"
    fi

    # transição → evita spike
    if ((transition_step > 0)); then
        output="$last_output"
        ((transition_step--))

        printf "<span font='VictorMonoNerdFontPropo 10'>%s</span>\n" "$output"
        last_output="$output"
        continue
    fi

    last_output="$output"

    # AWK entra aqui (rápido)
    colored=$(printf "%s\n" "$output" | colorize)
    printf "<span font='VictorMonoNerdFontPropo 10'>%s</span>\n" "$colored"

done
