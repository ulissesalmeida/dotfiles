autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export EDITOR="atom -w -n"
export ERL_AFLAGS="-kernel shell_history enabled"

# Auto Jump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# ASDF
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh

. $HOME/.dotfiles/script/aliases.sh

export GPG_TTY=$(tty)
