# ~/.bash_profile
#
# ~/.bash_profile or ~/.bash_login or ~/.profile is executed when starting
# interactive login shell, or non-interactive shell with the --login option.
#
# ~/.bashrc is executed when starting interactive non-login shell.
#
# E.g. on macOS:
# -- Creating a new Terminal Window/Tab executes just ~/.bash_profile.
# -- Invoking "bash" in an existing Terminal Window/Tab executes just ~/.bashrc.
#
# E.g. ssh, scp, sync to remote machine:
# -- Connecting via ssh to remote destination executes just ~/.bash_profile at
#    the destination.
# -- Running scp or rsync to remote ssh destination executes just ~/.bashrc at
#    the destination.
#
# Hence,
# -- Put PATH modifications in ~/.bash_profile.
# -- Source bash completions in ~/.bash_profile.
# -- Put aliases and other customizations in ~/.bashrc.
# -- Invoke ~/.bashrc at the end of ~/.bash_profile.

export PLATFORM=unknown
case "$(uname)" in
    Linux)  PLATFORM=linux   ;;
    Darwin) PLATFORM=mac     ;;
    *)      PLATFORM=unknown ;;
esac

export CODE="$HOME/code"

################################################################################
# PATH Customizations

export PATH="$HOME/anaconda/bin:/opt/local/bin:$PATH"


################################################################################
# Bash Completions

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion


################################################################################
# Invoke ~/.bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi
