#!/bin/bash

usage=$(top -bn1 | grep "%CPU(s)" | awk '{gsub(",", "."); print int(100 - $8)}')

cores=$(mpstat -P ALL 1 1 | awk '/^[0-9]/ && $2 != "CPU" {
    gsub(",", ".", $NF)
    use = int(100 - $NF)
    if (use < 13) icon = "▁"
    else if (use < 25) icon = "▂"
    else if (use < 38) icon = "▃"
    else if (use < 50) icon = "▄"
    else if (use < 63) icon = "▅"
    else if (use < 75) icon = "▆"
    else if (use < 88) icon = "▇"
    else icon = "█"
    printf "Core %s: %s %d%%  |  ", $2, icon, use
}')

if [ "$usage" -lt 30 ]; then
    icon="󰾆"; class="low"
elif [ "$usage" -lt 60 ]; then
    icon="󰾅"; class="mid"
elif [ "$usage" -lt 85 ]; then
    icon="󰓅"; class="high"
else
    icon="󱃂"; class="critical"
fi

echo "{\"text\": \"$icon $usage%\", \"tooltip\": \"$cores\", \"class\": \"$class\"}"
