# ~/.bash_profile
#
# Bash Startup Files
# https://www.gnu.org/software/bash/manual/html_node/Bash-Startup-Files.html
#
# When Bash is run as an interactive login shell, or as a non-interactive shell
# with the --login option:
#   it first executes /etc/profile, and
#   it then executes the first of ~/.bash_profile, ~/.bash_login, ~/.profile.
#
# When Bash is run as interactive non-login shell:
#   it executes ~/.bashrc.
#   (and $- will contain "i".)
#
# When Bash is run with its standard input connected to a network connection, as
# when executed by the remote shell daemon, usually rshd, or the secure shell
# daemon sshd:
#   it executes ~/.bashrc.
#   (and $- will not contain "i".)
#
# The above can be depicted in a tabular form as:
# |                 | non-login | login | sshd |
# | non-interactive |           | pr    | rc   |
# | interactive     | rc        | pr    | pr   |
#
# E.g. on macOS:
# -- Creating a new Terminal Window/Tab executes just ~/.bash_profile.
# -- Invoking "bash" in an existing Terminal Window/Tab executes just ~/.bashrc.
#
# E.g. ssh, scp, sync to remote machine:
# -- Connecting via ssh to remote destination executes just ~/.bash_profile at
#    the destination.
# -- Running command via ssh to remote destination executes just ~/.bashrc at
#    the destination.
# -- Running scp or rsync to remote ssh destination executes just ~/.bashrc at
#    the destination.
#
# Hence,
# -- Source ~/.bashrc at the end of ~/.bash_profile.
# -- Put almost everything in ~/.bashrc.
# -- Split ~/.bashrc in non-interactive top half and interactive bottom half.
# -- In non-interactive part of ~/.bashrc:
#    -- Put PATH modifications.
# -- In interactive part of ~/.bashrc:
#    -- Source bash completions.
#    -- Put aliases.
#    -- Put PS1 and other customizations.

################################################################################
# Custom .bash_profile files

for custom_bash_profile in "$HOME"/.bash_profile.*[^~]; do
    [ -f "${custom_bash_profile}" ] && source "${custom_bash_profile}"
done


################################################################################
# Invoke ~/.bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    source "$HOME/.bashrc"
    fi
fi
