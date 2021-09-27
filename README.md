# dotfiles

## Notes

Also check `grep -r --exclude-dir dracula TODO`

- `dircolors`: `dircolors --print-database` but with `TERM foot` added.
- `bashrc`: Mostly default `/etc/skel/.bashrc` with some sections uncommented,
  plus allowing `foot` for colors. Also slightly modified `PS1`.
- `local/bin/imv`: For placing `imv` in the `PATH`. The debian package places it
  in `/usr/libexec/imv/imv` due to a name collision with another package.
- `config/gtk-3.0/settings.ini`: Manually added
  `gtk-application-prefer-dark-theme=1`.
- `config/fontconfig/conf.d/70-no-dejavu.conf`: Stolen from
  [`stove-panini/fontconfig-emoji`](https://github.com/stove-panini/fontconfig-emoji).
- `config/wofi/style.css`: Stolen from
  [`dracula/wofi`](https://github.com/dracula/wofi), just changed the font.
- dconf: GTK3 ignores settings for some reason. Set theme and font settings in
  `org.gnome.desktop.interface`.
- `ssh/config`: Stolen from [Mozilla OpenSSH
  guidelines](https://infosec.mozilla.org/guidelines/openssh).
