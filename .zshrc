# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/Library/Haskell/bin:~/.nimble/bin:~/.cargo/bin:$PATH

# go environment
export GOPATH=$HOME/.go
#export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME='nanotech'
ZSH_THEME='mgutz'
#ZSH_THEME='ys'
ZSH_THEME='sunaku'

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
#
export ANDROID_HOME=~/Developer/sdks/android-sdk
export ANDROID_NDK=~/Developer/tools/ndk
export ANDROID_SDK=~/Developer/sdks/android-sdk
export FIREBASE_CPP_SDK_DIR=~/Developer/sdks/firebase_cpp_sdk
export FIREBASE_SDK=~/Developer/sdks/firebase_cpp_sdk

#alias vim = '/usr/local/Cellar/vim/8.0.0596/bin/vim'
#alias vim=mvim
#
alias vi=~/.nvim/bin/nvim
alias vim=~/.nvim/bin/nvim
alias n='~/.nvim/bin/nvim -c Defx'
alias ee=/usr/local/bin/emacs

alias premake=premake5
alias t=tmux
alias tn='tmux new -s '
alias to='tmux a -t '
#alias go='http_proxy=127.0.0.1:53779 https_proxy=127.0.0.1:53779 go'
alias dm=docker-machine
alias dc=docker-compose

#
#export BXSHARE=/usr/local/share/bochs


# google cloud sdk
. /Users/hxl/Developer/google-cloud-sdk/completion.zsh.inc
. /Users/hxl/Developer/google-cloud-sdk/path.zsh.inc

# ss proxy
#export http_proxy="socks5://127.0.0.1:1080"
#export https_proxy="socks5://127.0.0.1:1080"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT="/Users/hxl/2018/cocos2d-x-3.17/tools/cocos2d-console/bin"
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_X_ROOT for cocos2d-x
export COCOS_X_ROOT="/Users/hxl/2018"
export PATH=$COCOS_X_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT="/Users/hxl/2018/cocos2d-x-3.17/templates"
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable NDK_ROOT for cocos2d-x
export NDK_ROOT="/Users/hxl/Developer/tools/ndk"
export PATH=$NDK_ROOT:$PATH

# Add environment variable ANDROID_SDK_ROOT for cocos2d-x
export ANDROID_SDK_ROOT="/Users/hxl/Developer/sdks/android-sdk"
export PATH=$ANDROID_SDK_ROOT:$PATH
export PATH=$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT="/Users/hxl/Developer/tools/ant/bin"
export PATH=$ANT_ROOT:$PATH

export COPYFILE_DISABLE=true


# http[s] proxy
#export http_proxy="http://127.0.0.1:53779"
#export https_proxy="http://127.0.0.1:53779"


. /Users/hxl/hxl/torch/install/bin/torch-activate

# start tmux
if [ -z "$TMUX" ]; then ( tmux a -t default || exec tmux new -s default; ); fi
