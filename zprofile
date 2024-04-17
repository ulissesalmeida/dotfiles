autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export EDITOR="code"

export ERL_AFLAGS="-kernel shell_history enabled"

# Auto Jump
[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

# ASDF
. $HOME/.asdf/completions/asdf.bash
. $HOME/.asdf/asdf.sh

# Google Cloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

. $HOME/dotfiles/script/aliases.sh

export GPG_TTY=$(tty)

eval "$(/opt/homebrew/bin/brew shellenv)"
