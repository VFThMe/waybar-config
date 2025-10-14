#!/usr/bin/env bash

# Путь к батарее
BAT="/sys/class/power_supply/BATT"

# Проверяем наличие файлов
if [ ! -f "$BAT/capacity" ] || [ ! -f "$BAT/status" ]; then
    echo '{"text":"No battery","class":"battery"}'
    exit 0
fi

# Получаем процент и статус
PERC=$(cat "$BAT/capacity")
STATUS=$(cat "$BAT/status")

# Выбираем иконку Nerd Font
if [ "$STATUS" = "Charging" ]; then
    ICON=""
elif [ "$PERC" -ge 80 ]; then
    ICON=""
elif [ "$PERC" -ge 70 ]; then
    ICON=""
elif [ "$PERC" -ge 50 ]; then
    ICON=""
elif [ "$PERC" -ge 30 ]; then
    ICON=""
elif [ "$PERC" -ge 10 ]; then
    ICON=""
else
    ICON="󰂃"
fi

# Определяем класс для CSS
if [ "$PERC" -ge 50 ]; then
    CLASS="high"
elif [ "$PERC" -ge 20 ]; then
    CLASS="medium"
else
    CLASS="low"
fi

# Вывод JSON для Waybar
printf '{"text":"%s %s%%","class":"battery %s"}\n' "$ICON" "$PERC" "$CLASS"

