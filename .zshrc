#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

### PATH
# Add Visual Studio Code (code)
#export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
# Add Go-lang
#export GOPATH="/Users/yota-ni/go"
#export PATH="$GOPATH/bin:$PATH"
# Add pyenv
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
# Add Understand.app
#export STIHOME="/Applications/Understand.app"
#export PATH="$STIHOME/Contents/MacOS:$PATH"
#export PYTHONPATH="$STIHOME/Contents/MacOS/Python:$PYTHONPATH"
# Add Rust and Cargo
#export PATH="$HOME/.cargo/bin:$PATH"
# Add Cobra
#export COBRA="/Users/yota-ni/src/github/Cobra"
#export PATH="$PATH:$COBRA/bin_mac"

# どこかから入手してビルド・インストールするソフトの
# インストール先を$HOME/usr としておく
export PATH="$PATH:$HOME/usr/bin"
# add MANPATH
export MANPATH="$(manpath):$HOME/usr/man"

# opensslの1.1を参照するようにする
#BREW_PREFIX="/usr/local/opt"
#export LDFLAGS="-L$BREW_PREFIX/openssl@1.1/lib"
#export CFLAGS="-I$BREW_PREFIX/openssl@1.1/include"
#export CPPFLAGS="-I$BREW_PREFIX/openssl@1.1/include"

### General Settings
setopt no_beep  # ビープ音を鳴らさない

### History
setopt extended_history    # ヒストリに実行時間も保存
setopt share_history       # 他シェルのヒストリも共有
setopt hist_reduce_blanks  # 余分なスペースを削除してヒストリに保存
function history-all { history -E 1 }  # すべてのヒストリを表示

### Alias
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias du="du -h"
alias df="df -h"

alias su="su -l"


### Other
# cdコマンド実行時にls
function cd() {
  builtin cd $@ && ls;
}

## CppUTest
#export CPPUTEST_HOME=/home/nishi/src/github/cpputest-latest

## asdf
# asdf 起動
#. $HOME/.asdf/asdf.sh
# asdf 補完
#fpath=(${ASDF_DIR}/completions $fpath)
#autoload -Uz compinit && compinit

# pyenvのshimsと自動補完を有効化する設定
# PATH設定の下に記述する必要がある
#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi

# pyenv-virtualenvの設定
#eval "$(pyenv virtualenv-init -)"
