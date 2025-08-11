#!/bin/bash

# Иконки (Font Awesome)
ICON_FIREFOX=""
ICON_TOR=""       # или  (щит)
ICON_STEAM=""     # или  (пингвин)

# Проверяем процессы (используем pgrep -x для точного совпадения)
FIREFOX_RUNNING=$(pgrep -x "firefox" >/dev/null && echo "1" || echo "0")
TOR_RUNNING=$(pgrep -x "tor-browser" >/dev/null && echo "1" || echo "0")
STEAM_RUNNING=$(pgrep -x "steam" >/dev/null && echo "1" || echo "0")

# Формируем текст с Pango-разметкой (цвета прямо в строке)
if [ "$FIREFOX_RUNNING" -eq 1 ]; then
    FIREFOX_ICON="<span foreground='#ff0000'>$ICON_FIREFOX</span>"
else
    FIREFOX_ICON="<span foreground='#808080'>$ICON_FIREFOX</span>"
fi

if [ "$TOR_RUNNING" -eq 1 ]; then
    TOR_ICON="<span foreground='#ff0000'>$ICON_TOR</span>"
else
    TOR_ICON="<span foreground='#808080'>$ICON_TOR</span>"
fi

if [ "$STEAM_RUNNING" -eq 1 ]; then
    STEAM_ICON="<span foreground='#ff0000'>$ICON_STEAM</span>"
else
    STEAM_ICON="<span foreground='#808080'>$ICON_STEAM</span>"
fi

# Выводим иконки через пробел
echo "$FIREFOX_ICON          $TOR_ICON         $STEAM_ICON"
