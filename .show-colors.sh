#!/bin/bash
# будет отображать график вашей текущей цветовой гаммы терминала. Это удобно для тестирования и еще много чего.
# Original: http://frexx.de/xterm-256-notes/ [dead link 2013-11-21]
#           http://frexx.de/xterm-256-notes/data/colortable16.sh [dead link 2013-11-21]
# Copy: https://wiki.archlinux.org/index.php/X_resources_(%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9)
# Modified by Aaron Griffin
# and further by Kazuo Teramoto
FGNAMES=(' black ' '  red  ' ' green ' ' yellow' '  blue ' 'magenta' '  cyan ' ' white ')
BGNAMES=('DFT' 'BLK' 'RED' 'GRN' 'YEL' 'BLU' 'MAG' 'CYN' 'WHT')

echo "     ┌──────────────────────────────────────────────────────────────────────────┐"
for b in {0..8}; do
    ((b>0)) && bg=$((b+39))

    echo -en "\033[0m ${BGNAMES[b]} │ "

    for f in {0..7}; do
        echo -en "\033[${bg}m\033[$((f+30))m ${FGNAMES[f]} "
    done

    echo -en "\033[0m │"
    echo -en "\033[0m\n\033[0m     │ "

    for f in {0..7}; do
        echo -en "\033[${bg}m\033[1;$((f+30))m ${FGNAMES[f]} "
    done

    echo -en "\033[0m │"
    echo -e "\033[0m"

    ((b<8)) &&
        echo "     ├──────────────────────────────────────────────────────────────────────────┤"
done
echo "     └──────────────────────────────────────────────────────────────────────────┘"
