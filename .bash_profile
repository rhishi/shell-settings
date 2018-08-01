# ~/.bash_profile
#
# ~/.bash_profile or ~/.bash_login or ~/.profile is executed when starting
# interactive login shell, or non-interactive shell with the --login option.
#
# ~/.bashrc is executed when starting interactive non-login shell.
#
# E.g. on macOS:
# 1) Creating a new Terminal Window/Tab executes ~/.bash_profile.
# 2) Invoking "bash" in an existing Terminal Window/Tab executes ~/.bashrc.
#
# Hence,
# 1) Put PATH modifications in ~/.bash_profile
# 2) Put aliases and other customizations in ~/.bashrc.
# 3) Invoke ~/.bashrc at the end of ~/.bash_profile.

echo Executing .bash_profile

# Invoke ~/.bashrc
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi
