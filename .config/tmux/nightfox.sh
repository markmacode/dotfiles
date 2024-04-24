#!/usr/bin/env bash
theme_bg0="#131a24"
theme_bg1="#192330"
theme_bg2="#212e3f"
theme_bg3="#29394f"
theme_bg4="#39506d"

theme_fg0="#d6d6d7"
theme_fg1="#cdcecf"
theme_fg2="#aeafb0"
theme_fg3="#71839b"
theme_fg4="#738091"

theme_cyan="#63cdcf"
theme_pink="#d67ad2"
theme_orange="#f4a261"
theme_red="#c94f6d"

theme_purple="#9d79d6"
theme_purple_fg="#baa1e2"
theme_purple_bg="#3c3759"

theme_blue="#719cd6"
theme_blue_fg="#86abdc"
theme_blue_bg="#2f4159"

theme_yellow="#dbc074"
theme_yellow_fg="#e0c989"
theme_yellow_bg="#4f4c3c"

theme_green="#81b29a"
theme_green_fg="#8ebaa4"
theme_green_bg="#344847"

theme_border="#6085b6"

set -g mode-style "fg=$theme_yellow,bg=$theme_yellow_bg"
set -g message-style "fg=$theme_yellow_fg,bg=$theme_yellow_bg"
set -g message-command-style "fg=$theme_yellow_fg,bg=$theme_yellow_bg"
set -g pane-border-style "fg=$theme_bg3"
set -g pane-active-border-style "fg=$theme_border"
set -g status "on"
set -g status-style "fg=$theme_fg1,bg=$theme_bg0"
set -g status-position top
set -g status-bg "${theme_bg0}"
set -g status-justify "left"
set -g status-left-length "100"
set -g status-right-length "100"
set -g status-left-style NONE
set -g status-right-style NONE
set -g status-left ""
set -g status-right "\
#[fg=$theme_fg3,bg=$theme_bg0]%Y-%m-%d #[fg=$theme_bg4]|#[fg=$theme_fg3,bg=$theme_bg0] %H:%M  \
#[fg=$theme_bg3,bg=$theme_bg0]#[fg=$theme_fg2,bg=$theme_bg3] #h#[fg=$theme_bg3,bg=$theme_bg0] \
#[fg=$theme_purple_bg,bg=$theme_bg0]#[fg=$theme_purple_fg,bg=$theme_purple_bg]󰆧 #S \
"
setw -g window-status-style "fg=$theme_fg3,bg=$theme_bg0"
setw -g window-status-format "#[default] #I#[fg=$theme_bg4]:#[default]#W#F "
setw -g window-status-current-format "#[fg=$theme_blue_fg,bg=$theme_blue_bg] #I #W#F "
setw -g window-status-separator ""
