# Normal config
ZSH_THEME="robbyrussell"
plugins=(git sudo brew autoenv virtualenv virtualenvwrapper)
source $ZSH/oh-my-zsh.sh

# launchctl setenv MATLAB_JAVA /Library/Java/JavaVirtualMachines/jdk1.7.0_45.jdk/Contents/Home/jre
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
# User Config
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

export KEYTIMEOUT=1

alias v=nvim
alias c=cd
alias texbuild="texfind | xargs latexmk -pvc"

# ghc-pkg-reset
# Removes all installed GHC/cabal packages, but not binaries, docs, etc.
# Use this to get out of dependency hell and start over, at the cost of some rebuilding time.
function ghc-pkg-reset() {
read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
test x$ans == xy && ( \
    echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
    echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
    # echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
    # echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
    )
}
