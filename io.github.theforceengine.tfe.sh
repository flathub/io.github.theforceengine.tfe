#!/bin/bash
set -e
if [[ -z "$TFE_SKIP_DATACHECK" ]]; then
    declare -a dfpaths=("$XDG_DATA_HOME"
                        "$HOME/.local/share/Steam/steamapps/common/Dark Forces/Game/"
                        "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Dark Forces/Game/")
    for check in "${dfpaths[@]}"; do
        if [[ ! -z $(find "$check" -iname 'dark.gob') ]]; then
            FOUND_DFDATA="true"
            echo "Found Dark Forces data: $check"
            break
        fi
    done
    if [[ -z "$FOUND_DFDATA" ]]; then
        zenity --error \
            --text "<b>Could not find Dark Forces game data</b>\\n\\nPlease either install Dark Forces via Steam to your default library path or copy the game data to <tt><b>$XDG_DATA_HOME/</b></tt>." \
            --ok-label 'Close' \
            --no-wrap
    fi
fi
export TFE_DATA_HOME='/app/share/TheForceEngine'
exec theforceengine
