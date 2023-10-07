# Hiding dirs / files from showing in fzf
export FZF_DEFAULT_COMMAND="rg --files --follow --no-ignore-vcs --hidden -g '!{**/node_modules/*,**/.git/*}'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Shortcuts
alias c='clear'
alias untar='tar -xvzf'
alias untarxz='tar -xvJf'
alias dotfiles='nvim $DOTFILES'

# Python
alias py='python3'
alias vc='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
