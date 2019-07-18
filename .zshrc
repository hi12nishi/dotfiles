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
