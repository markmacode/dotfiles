# Hiding dirs / files from showing in fzf
export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
