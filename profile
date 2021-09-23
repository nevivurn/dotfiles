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

if [ $(tty) = "/dev/tty1" ]; then
    ## Wayland compat settings
    export MOZ_ENABLE_WAYLAND=1 # force wayland on firefox
    export QT_QPA_PLATFORM=wayland # force wayland on qt
    # Possibly required for xdg-desktop-portal (TODO).
    # Also, XDG_SESSION_TYPE=wayland required for im-config.
    export XDG_SESSION_TYPE=wayland
    export XDG_CURRENT_DESKTOP=sway
    
    # Make qt use gtk2 themes
    # TODO: figure out why gtk3 does not work.
    export QT_QPA_PLATFORMTHEME=gtk2
    # Configure VDPAU driver
    export VDPAU_DRIVER=radeonsi

    # Configure input method environment variables
    # We need to source it here again because it requires
    # XDG_SESSION_TYPE=wayland, and that's not set until this file.
    # Actually launching the input method daemon is handled by sway.
    source /etc/profile.d/im-config_wayland.sh

    # Configure gpg-agent environment variables
    # We're running on wayland, but it's fine for the most part.
    # This requires enable-ssh-support set in gpg-agent.conf.
    source /etc/X11/Xsession.d/90gpg-agent

    exec sway
fi
