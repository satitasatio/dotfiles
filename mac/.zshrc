export LANG=ja_JP.UTF-8

eval "$(/opt/homebrew/bin/brew shellenv)"

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
export CMS_LOCAL=~/Workspace/cms

# direnv
export EDITOR=nvim
eval "$(direnv hook zsh)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Go
export PATH="$HOME/go/bin:$PATH"

# anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# PHP
export PATH="$HOME/.phpenv/bin:$PATH"
eval "$(phpenv init -)"

export PATH="/opt/homebrew/opt/bison/bin:$PATH"
export PATH="/opt/homebrew/opt/libxml2/bin:$PATH"
export PATH="/opt/homebrew/opt/bzip2/bin:$PATH"
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/libiconv/bin:$PATH"
export PATH="/opt/homebrew/opt/krb5/bin:$PATH"
export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c/bin:$PATH"
export PATH="/opt/homebrew/opt/tidy-html5/lib:$PATH"

export PKG_CONFIG_PATH="/opt/homebrew/opt/krb5/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/icu4c/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libedit/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libjpeg/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libpng/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libxml2/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libzip/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/oniguruma/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tidy-html5/lib/pkgconfig:$PKG_CONFIG_PATH"

export PHP_RPATHS="/opt/homebrew/opt/zlib/lib /opt/homebrew/opt/bzip2/lib /opt/homebrew/opt/curl/lib /opt/homebrew/opt/libiconv/lib /opt/homebrew/opt/libedit/lib /opt/homebrew/opt/curl/lib /opt/homebrew/opt/jpeg/lib /opt/homebrew/opt/libpng/lib /opt/homebrew/opt/mcrypt/lib"

export PHP_BUILD_CONFIGURE_OPTS="--with-openssl=$(brew --prefix openssl@1.1) --with-bz2=$(brew --prefix bzip2) --with-iconv=$(brew --prefix libiconv) --with-tidy=$(brew --prefix tidy-html5) --with-external-pcre=$(brew --prefix pcre2) --with-zlib-dir=/opt/homebrew/opt/zlib --with-curl=/opt/homebrew/opt/curl --with-jpeg-dir=/opt/homebrew/opt/jpeg --with-png-dir=/opt/homebrew/opt/libpng --with-mcrypt=/opt/homebrew/opt/mcrypt --with-zip --enable-intl --with-pear --with-pdo-sqlite --with-pcre-regex"

export PKG_CONFIG_PATH="$(brew --prefix krb5)/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="$(brew --prefix openssl@1.1)/lib/pkgconfig:$PKG_CONFIG_PATH"
export PKG_CONFIG_PATH="$(brew --prefix icu4c)/lib/pkgconfig:$PKG_CONFIG_PATH"

eval "$(starship init zsh)"
