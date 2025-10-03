eval "$(starship init zsh)"

unset WORDCHARS
autoload -U compinit
compinit
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}'

alias ls="ls --color"
alias rm="echo 'rm is dangerous, use trash instead'; false"

alias fcd="cd \$(ghq root)/\$(ghq list | fzf)"

export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_STATE_HOME=~/.local/state

export PATH=~/.local/bin:$PATH

export GOPATH=$XDG_DATA_HOME/go
export CARGO_HOME=$XDG_DATA_HOME/cargo
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export DENO_INSTALL_ROOT=$XDG_DATA_HOME/deno

export PATH=$GOPATH/bin:$CARGO_HOME/bin:$PATH
export PATH=~/Library/Python/3.9/bin:$PATH

alias python=python3

export PATH=$DENO_INSTALL_ROOT/bin:$PATH
export PATH=$HOME/.bun/bin:$PATH

# pnpm
export PNPM_HOME="/Users/akimon658/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
eval "$(gh copilot alias -- zsh)"
export PATH="$(brew --prefix)/opt/llvm/bin:$PATH"
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Must be at the end of the file
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
