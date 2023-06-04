# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/shibin/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # timer
    colored-man-pages
    common-aliases
    docker
    encode64
    extract
    fzf
    git
    history
    macos
    postgres
    ripgrep
    rust
    tmux
    # vi-mode
    web-search
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="vim ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# alias t="tmux"
# alias c="clear"
alias apps="cd /usr/local/Cellar"
alias b="brew"
alias c="code"
alias z="zellij"
alias dkcpdown="docker-compose down"
alias dkcpstart="docker-compose start"
alias dkcpstop="docker-compose stop"
alias dkcpup="docker-compose up -d"
alias dkimgs="docker images"
alias dkps="docker ps -a"
alias dkpsa="docker ps -a"
alias dkst="docker stats"
alias f="ranger"
alias ldd="otool -L"
alias os="neofetch"
alias rc="rm -rf ./*"
alias rm="rm"
alias strace="dtrace"
alias t="open -a typora"
alias work="ssh work"
alias wr="ssh shibin@192.168.1.178"
alias du="ncdu"
alias work="ssh shibin@172.16.163.130"

whoseport() {
    lsof -i ":$1" | grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn} LISTEN
}

listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

# homebrew bottle
# export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
# brew install without updating
# disable for Analytics
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_AUTO_UPDATE_SECS=604800
export HOMEBREW_CLEANUP_MAX_AGE_DAYS=604800
export HOMEBREW_VERBOSE=1
# export HOMEBREW_BAT=1
# export HOMEBREW_CURL_VERBOSE=1
# export HOMEBREW_NO_AUTO_UPDATE=1

# Options to fzf command
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
set rtp+=/usr/local/opt/fzf
export FZF_DEFAULT_OPTS='--preview --no-height --no-reverse'
export FZF_CTRL_T_OPTS="--preview '(highlight -O ansi -l {} 2> /dev/null || cat {} || tree -C {}) 2> /dev/null | head -200'"
# _fzf_compgen_path() {
#   fd --hidden --follow --exclude ".git" . "$1"
# }
# export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'

# zsh autosuggestions / zsh completions / zsh syntax highlighting
# source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=247'
bindkey '^ ' autosuggest-accept

# autoload -U compinit && compinit
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# git-extras
source /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export TERMINFO=/usr/share/terminfo
export TERM=xterm-256color

# Android
# export PATH=${PATH}:~/Library/Android/sdk/ndk-bundle
# export PATH=${PATH}:~/Library/Android/sdk/platform-tools
# export PATH=${PATH}:~/Library/Android/sdk/tools
# export PATH=${PATH}:~/Library/Android/sdk/tools/bin
# export ANDROID_NDK_ROOT=~/Library/Android/sdk/ndk-bundle

initdevenv(){
    mkdir .devcontainer && cd .devcontainer && \
    wget https://raw.githubusercontent.com/ShiBin1990/conf-for-mac/master/continer_dev/.devcontainer/Dockerfile && \
    wget https://raw.githubusercontent.com/shibin1990/conf-for-mac/master/continer_dev/.devcontainer/devcontainer.json && \
    cd ..
}

# tmux title
export DISABLE_AUTO_TITLE=true

export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/sqlite/lib/pkgconfig"

# cheat config
export CHEAT_CONFIG_PATH="~/.config/cheat/conf.yml"
export CHEAT_USE_FZF=true

# export PATH="/usr/local/opt/curl/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/curl/lib/pkgconfig"
export PATH="/usr/local/opt/llvm/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"

export BAT_THEME=ansi-light

export PATH="/usr/local/opt/ncurses/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/gettext/bin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/python@3.8/lib"

# export GITHUB_TOKEN=581c1b769033b894a9cecf7ea065b572a2c553f5
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"

# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
  [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
  if [ $1 ]; then
    tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
  fi
  session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | fzf --exit-0) &&  tmux $change -t "$session" || echo "No sessions found."
}
# fs [FUZZY PATTERN] - Select selected tmux session
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fs() {
  local session
  session=$(tmux list-sessions -F "#{session_name}" | \
    fzf --query="$1" --select-1 --exit-0) &&
  tmux switch-client -t "$session"
}
# ftpane - switch pane (@george-b)
ftpane() {
  local panes current_window current_pane target target_window target_pane
  panes=$(tmux list-panes -s -F '#I:#P - #{pane_current_path} #{pane_current_command}')
  current_pane=$(tmux display-message -p '#I:#P')
  current_window=$(tmux display-message -p '#I')

  target=$(echo "$panes" | grep -v "$current_pane" | fzf +m --reverse) || return

  target_window=$(echo $target | awk 'BEGIN{FS=":|-"} {print$1}')
  target_pane=$(echo $target | awk 'BEGIN{FS=":|-"} {print$2}' | cut -c 1)

  if [[ $current_window -eq $target_window ]]; then
    tmux select-pane -t ${target_window}.${target_pane}
  else
    tmux select-pane -t ${target_window}.${target_pane} &&
    tmux select-window -t $target_window
  fi
}
# export PATH="/usr/local/opt/sqlite/bin:$PATH"
export PATH="/usr/local/opt/gnu-getopt/bin:$PATH"
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.rustup/toolchains/stable-x86_64-apple-darwin/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export LDFLAGS="-L/usr/local/opt/icu4c/lib"
export CPPFLAGS="-I/usr/local/opt/icu4c/include"
export PKG_CONFIG_PATH="/usr/local/opt/icu4c/lib/pkgconfig"
export PATH=~/bin:$PATH

# git
first() {
	branch=refs/heads/master
	git log --reverse --pretty=%H $branch | head -1 | xargs git checkout
}

last() {
	branch=refs/heads/master
	git log --pretty=%H $branch | head -1 | xargs git checkout
}

next() {
	branch=refs/heads/master
	if [ -z "$1" ]; then
		n=1
	else
		n=$1
	fi
	git log --reverse --pretty=%H $branch | grep -A $n $(git rev-parse HEAD) | tail -1 | xargs git checkout
}

prev() {
	branch=refs/heads/master
	if [ -z "$1" ]; then
		n=1
	else
		n=$1
	fi
	git checkout HEAD~$n
}

enable_proxy(){
    export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
}

export PATH="/usr/local/opt/libpq/bin:$PATH"


# Install (one or multiple) selected application(s)
# using "brew search" as source input
# mnemonic [B]rew [I]nstall [P]lugin
bip() {
  local inst=$(brew search | fzf -m)

  if [[ $inst ]]; then
    for prog in $(echo $inst);
    do; brew install $prog; done;
  fi
}
# Update (one or multiple) selected application(s)
# mnemonic [B]rew [U]pdate [P]lugin
bup() {
  local upd=$(brew leaves | fzf -m)

  if [[ $upd ]]; then
    for prog in $(echo $upd);
    do; brew upgrade $prog; done;
  fi
}
# Delete (one or multiple) selected application(s)
# mnemonic [B]rew [C]lean [P]lugin (e.g. uninstall)
bcp() {
  local uninst=$(brew leaves | fzf -m)

  if [[ $uninst ]]; then
    for prog in $(echo $uninst);
    do; brew uninstall $prog; done;
  fi
}
export PATH="/usr/local/sbin:$PATH"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

export PATH="/usr/local/opt/node@16/bin:$PATH"
export PATH="~/.local/bin:$PATH"

# rustup
export RUSTUP_DIST_SERVER="https://rsproxy.cn"
export RUSTUP_UPDATE_ROOT="https://rsproxy.cn/rustup"

eval "$(starship init zsh)"

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#a8a8a8"

function mkbuild() {
    echo "#!/bin/bash
# config
cmake -S . -B build \\
    -DCMAKE_BUILD_TYPE=Debug \\
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

# build
cmake --build build -j $(nproc --all)
" >build.sh

    chmod +x build.sh
}

if [[ "$TERM_PROGRAM" != "vscode" ]]; then
    eval "$(zellij setup --generate-auto-start zsh)"
fi