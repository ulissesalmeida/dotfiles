export PATH="$HOME/bin:$PATH"
export EDITOR="atom -w -n"
export ERL_AFLAGS="-kernel shell_history enabled"

# Bash Completion
[[ -r $(brew --prefix)/etc/bash_completion ]] && . $(brew --prefix)/etc/bash_completion

# Auto Jump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# ASDF
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh

. $HOME/.dotfiles/script/prompt
. $HOME/.dotfiles/script/aliases.sh
