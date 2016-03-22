# Normal config
ZSH_THEME="robbyrussell"
plugins=(git sudo archlinux brew)
source $ZSH/oh-my-zsh.sh

# launchctl setenv MATLAB_JAVA /Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/jre
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# User Config
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

export KEYTIMEOUT=1

alias v nvim
alias c cd
