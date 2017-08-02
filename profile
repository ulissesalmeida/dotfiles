export PATH="$HOME/bin:$PATH"
export EDITOR="atom -w -n"

# Bash Completion
[[ -r $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

# ASDF
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh

. $HOME/.dotfiles/script/prompt
. $HOME/.dotfiles/script/aliases.sh
