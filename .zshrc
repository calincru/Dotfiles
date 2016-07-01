# Path to your oh-my-zsh installation.
export ZSH=/home/calin/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

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
DISABLE_AUTO_TITLE="true"

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
plugins=(git zsh-syntax-highlighting fasd archlinux cabal gitfast
         common-aliases
        )

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl"
export PATH="/home/calin/scripts:$PATH" # Add scripts dir to path
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
EDITOR=vim

# Preferred browser
BROWSER=firefox

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Tmux
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOQUIT=true
alias tmux='tmux -2'

# FASD for faster switching between directories
eval "$(fasd --init auto)"

# Local Variables
SCRIPTS_DIR="/home/calin/scripts"

# Aliases
alias vi='vim'
alias rm='rm -vi'
alias grep='grep --color=auto'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"
alias weather="curl -4 http://wttr.in/Bucharest"
alias python="/usr/bin/python2"

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias tmuxconf="vim ~/.tmux.conf"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"

# Remove annoying messages
unsetopt correctall

# Qt5 for android exports
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk
export ANDROID_HOME=/opt/android-sdk
export ANDROID_SDK=/opt/android-sdk
export ANDROID_NDK=/opt/android-ndk
export ANDROID_NDK_TOOLCHAIN_ROOT=/opt/android-ndk/toolchains
export Qt5_host=/usr
export Qt5_android=/opt/android-qt5/5.6.0/armeabi-v7a

export PATH="/opt/android-sdk/tools:$PATH"
export PATH="/opt/android-qt5/5.6.0/armeabi-v7a/bin:$PATH"

# Csound for Android
export SDK=$ANDROID_SDK
export NDK=$ANDROID_NDK
export ANDROID_NDK_ROOT=$NDK
export CSOUND_HOME=/home/calin/workspace/Csound6.06
export NDK_MODULE_PATH=${CSOUND_HOME}/android/pluginlibs
export PATH="${PATH}:$NDK_MODULE_PATH"
export NDKABI=19
export NDKVER=$NDK/toolchains/arm-linux-androideabi-4.9
export NDKP=$NDKVER/prebuilt/linux-x86_64/bin/arm-linux-androideabi-
export PATH="$NDKVER/prebuilt/linux-x86_64/bin:$PATH"
export NDKF="--sysroot $NDK/platforms/android-$NDKABI/arch-arm"
export NDKARCH="-march=armv7-a -mfloat-abi=softfp -Wl,--fix-cortex-a8"

