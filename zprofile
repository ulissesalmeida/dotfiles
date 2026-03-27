eval "$(/opt/homebrew/bin/brew shellenv)"

# ASDF

fpath=(${ASDF_DATA_DIR:-$HOME/.asdf}/completions $fpath)

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export EDITOR="nvim"

export ERL_AFLAGS="-kernel shell_history enabled"

# Auto Jump
[ -f $HOMEBREW_PREFIX/etc/profile.d/autojump.sh ] && . $HOMEBREW_PREFIX/etc/profile.d/autojump.sh

# Google Cloud
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

. $HOME/dotfiles/script/aliases.sh

export GPG_TTY=$(tty)
