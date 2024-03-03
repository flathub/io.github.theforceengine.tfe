#!/usr/bin/sh
# Check for game data
set -e
if [[ -z "$TFE_SKIP_DATACHECK" ]] && \
   [[ -z $(find "$XDG_DATA_HOME" -iname 'DARK.GOB') ]] && \
   [[ ! -d "$HOME/.local/share/Steam/steamapps/common/Dark Forces/Game/" ]] && \
   [[ ! -d "$HOME/.var/app/com.valvesoftware.Steam/.local/share/Steam/steamapps/common/Dark Forces/Game/" ]]; then
    zenity --error \
           --text "<b>Could not find Dark Forces game data</b>\\n\\nPlease either install Dark Forces via Steam to your default library path or copy the game data to <tt><b>$XDG_DATA_HOME/</b></tt>." \
           --ok-label 'Close' \
           --no-wrap
fi
export TFE_DATA_HOME='/app/share/TheForceEngine'
exec theforceengine
