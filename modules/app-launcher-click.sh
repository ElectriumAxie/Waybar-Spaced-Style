#!/bin/bash

# Координаты клика (X - горизонталь)
X=$1

# Если координаты не передаются - открываем Firefox (по дефолту)
if [ -z "$X" ]; then
    firefox &
    exit 0
fi

# Ширина зоны клика под каждую иконку (настраивайте!)
ZONE=1

# Определяем клик по зонам
if [ $X -lt $ZONE ]; then
    # Зона 1 (Firefox)
    pgrep firefox || firefox &
elif [ $X -lt $((ZONE * 2)) ]; then
    # Зона 2 (Tor)
    pgrep -f tor-browser || tor-browser &
else
    # Зона 3 (Steam)
    pgrep steam || steam &
fi
