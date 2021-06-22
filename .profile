# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# set homebrew bash-completion
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi


eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


########################## add screen alias by Geunchae #############################
alias l='ls -lF'
alias SR='screen -R'

alias ..='pushd .. >/dev/null'
alias ,,='popd >/dev/null'
alias dirs='dirs -v'
alias cd='pushd >/dev/null'

#PGC constants
#export mirror='--reference=/home001/mirror/lr/'

#android sdk
export ANDROID_SDK_ROOT=/usr/lib/android-sdk
export ANDROID_HOME=/usr/lib/android-sdk

#java
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64


#PGC functions
function PGC_rulecheckerUpdate() {
    pushd ~/bin/ && rm rulechecker.sh && wget http://atos-storage.lge.net:8080/results/rulechecker/rulechecker.sh --no-check-certificate && chmod +x rulechecker.sh && ll ~/bin/rulechecker.sh && popd
}

function PGC_rm_orig() {
    echo --deleting .orig files--
    find . -name *.orig
    rm `find . -name *.orig`
}

function PGC_help() {
    echo "------ PGC Command Helper!!! -----"
    echo "[Copy from other build server] : rsync -azuv -e ssh Id@Domain:/RemotePath /LocalPath"
    echo "[Create symbolic link]       : ln -s Target LinkName"
    echo "[Git push with gerrit]       : git push {remote} HEAD:refs/{for}/{Branch}"
}

# Nodejs
VERSION=v14.17.0
DISTRO=linux-x64
export PATH=/home/worker/bin/nodejs/node-$VERSION-$DISTRO/bin:$PATH

###################################
c_cyan=`tput setaf 6`
c_red=`tput setaf 1`
c_green=`tput setaf 2`
c_sgr0=`tput sgr0`
 
parse_git_branch ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      gitver=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
   else
      return 0
   fi
   echo -e "["$gitver"] "
}
 
branch_color ()
{
   if git rev-parse --git-dir >/dev/null 2>&1
   then
      color=""
	  if git diff --quiet 2>/dev/null >&2      
	  then
         color="${c_green}"
      else
         color=${c_red}
      fi
   else
      return 0
   fi
   echo -ne $color
}

 
#export PS1='\u@\h\[${c_sgr0}\]:\W\[${c_sgr0}\] (\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\])\$ '

###################################

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='\[$(branch_color)\]$(parse_git_branch)\[${c_sgr0}\]${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1='$(my_branch)${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

## If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
#    ;;
#*)
#    ;;
#esac
