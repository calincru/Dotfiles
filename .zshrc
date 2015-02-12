# Local Variables
SCRIPTS_DIR="/home/calin/dev/scripts"

# PATH addings
# export PATH="/home/calin/qt5/qtbase/bin:$PATH" # qt5 x86_64 binaries
export PATH="/home/calin/qt5-android-release/qtbase/bin:$PATH" # qt5 arm
export PATH="/home/calin/qt-creator/build/bin:$PATH" # qt-creator binary

export PATH="/home/calin/android/jdk1.7.0_67/bin:$PATH" # JKD
export PATH="/home/calin/android/apache-ant-1.9.4/bin:$PATH" # ANT
export PATH="/home/calin/android/android-sdk/platform-tools:$PATH" # SDK
export PATH="/home/calin/android/android-sdk/tools:$PATH" # SDK tools

# Prompt
ZSH_THEME="clean"

# Aliases
alias l="ls -F"
alias ll="ls -AGlFt"
alias grep='grep --color=auto'
alias reload="source ~/.zshrc"
alias netest="ping 8.8.8.8"
alias qtcreator="nohup qtcreator &>/dev/null &"
alias eclipse="nohup /home/calin/Workplace/eclipse/eclipse &>/dev/null &"

alias sysupdate="sudo $SCRIPTS_DIR/system-update.sh"
alias clearwsp="$SCRIPTS_DIR/clear_whitespaces.sh"
alias setLDLP="source $SCRIPTS_DIR/set_LDLP.sh"

# Important files
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vimrc"
alias vimlast="vim -c \"normal '0\""
alias syslog="vim /var/log/syslog"

# Shorthands
alias e="exit"
alias py="python"
alias h='history'

# Exports
export JAVA_HOME=/home/calin/android/jdk1.7.0_67
export ANDROID_HOME=/home/calin/android/android-sdk
export ANDROID_SDK=/home/calin/android/android-sdk
export ANDROID_SDK_ROOT=/home/calin/android/android-sdk
export ANDROID_NDK=/home/calin/android/android-ndk
export ANDROID_NDK_TOOLCHAIN_ROOT=/home/calin/android/android-ndk/toolchains
export ANDROID_NDK_ROOT=/home/calin/android/android-ndk
export ANDROID_NDK_HOST=linux-x86_64
export ANDROID_NDK_PLATFORM=android-9
export ANDROID_NDK_TOOLCHAIN_VERSION=4.8
export ANDRIOD_BUILD_TOOLS_REVISION=20.0.0

export Qt5_host=/home/calin/qt5/qtbase
export Qt5_android=/home/calin/qt5-android-release/qtbase

export EDITOR="vim"
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

# Remove annoying messages
unsetopt correctall

# FASD for faster switching between directories
eval "$(fasd --init auto)"

# LLVM exports
export LLVM_BUILD_DIR=/home/calin/Workplace/llvm_workshop/llvm-build
export LLVM_SOURCE_DIR=/home/calin/Workplace/llvm_workshop/llvm
export LLVM_CFLAGS="$(llvm-config --cxxflags) -fno-rtti"
export LLVM_LDFLAGS="$(llvm-config --ldflags)"

# alt-left and alt-right for switching words in terminal
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# ZSH Settings
CASE_SENSITIVE="true"

ZSH=$HOME/.oh-my-zsh
plugins=(git common-aliases debian mercurial fasd zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
