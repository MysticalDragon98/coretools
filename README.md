# Coretools

## Installation

Ubuntu / Debian:
```sh
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/MysticalDragon98/coretools/master/build/index.sh?token=$(date +%s)~)"
```

## Packages
Coretools installs the following packages

- Nginx
- Supervisor
- Git
- NodeJS
- Yarn
- TS Node
- Snap
- Certbot

## Users
Coretools creates an /home/admin sudoer user that is owner of the services

- Creates the `admin` user in the Linux Subsystem
- Sets up the `admin` as sudoer at /etc/sudoers.d/admin
- Adds the after-login.sh script to `/etc/bash.bashrc` so it executes each time someone logins
- Adds `~/conf/supervisor` dir to the /etc/supervisor/supervisord.conf
- Clones the scripts repository to `~/.scripts`
- Clones the bin repository to `~/.bin`