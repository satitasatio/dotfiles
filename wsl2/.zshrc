if [ -f ${HOME}/.zplug/init.zsh ]; then
  source ${HOME}/.zplug/init.zsh
fi

zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "dracula/zsh", as:theme
zplug "zsh-users/zsh-completions"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

if [ -e "$HOME/.nodenv" ]
then
  export NODENV_ROOT="$HOME/.nodenv"
  export PATH="$NODENV_ROOT/bin:$PATH"
  if command -v nodenv 1>/dev/null 2>&1
  then
    eval "$(nodenv init -)"
  fi
fi

if [[ -d ~/.nodenv && ! -d $(nodenv root)/plugins/node-build ]];then
  git clone https://github.com/nodenv/node-build.git $(nodenv root)/plugins/node-build
  git clone https://github.com/nodenv/nodenv-update.git $(nodenv root)/plugins/nodenv-updat
fi

# pipenv
export PATH="$PATH:$HOME/.local/bin"

source $HOME/.cargo/env

# exa
if [[ $(command -v exa) ]]; then
  alias e='exa --icons --git'
  alias l=e
  alias ls=e
  alias ea='exa -a --icons --git'
  alias la=ea
  alias ee='exa -aahl --icons --git'
  alias ll=ee
  alias et='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias lt=et
  alias eta='exa -T -a -I "node_modules|.git|.cache" --color=always --icons | less -r'
  alias lta=eta
  alias l='clear && ls'
fi

# alias
alias vim='nvim'

export PATH="$HOME/.yarn/bin:$PATH"

eval "$(starship init zsh)"
