COLOR_GREEN='\033[38;5;118m'
COLOR_RED='\033[38;5;196m'
COLOR_BLUE='\033[38;5;39m'

STYLE_NONE="\033[0m"

SYMBOL_OK=$COLOR_GREEN'✔'$STYLE_NONE
SYMBOL_ERROR=$COLOR_RED'✖'$STYLE_NONE
SYMBOL_QUESTION=$COLOR_BLUE'?'$STYLE_NONE

print () {
    local message="$@"

    printf "${message}${STYLE_NONE}\n"
}

APT_APT_UPDATE_IS_ALREADY_UPDATED=0

apt_update () {
    if [ $APT_APT_UPDATE_IS_ALREADY_UPDATED -eq 1 ]; then
        return 1
    fi
    
    sudo apt-get update
    APT_APT_UPDATE_IS_ALREADY_UPDATED=1
}

apt_install () {
    apt_update

    sudo apt-get install -y $1
}

NGINX_FOLDER=/etc/nginx
NGINX_CONF_FILE=$NGINX_FOLDER/nginx.conf

is_nginx_installed () {
    if [ -f "$NGINX_CONF_FILE" ]; then
        echo true
    else
        echo false
    fi
}

install_nginx () {
    print "Installing Nginx..."
    apt_install nginx
    print "${SYMBOL_OK} Nginx installed."
}

SUPERVISOR_FOLDER=/etc/supervisor
SUPERVISOR_CONF_FILE=$SUPERVISOR_FOLDER/supervisord.conf

is_supervisor_installed () {
    if [ -f "$SUPERVISOR_CONF_FILE" ]; then
        echo true
    else
        echo false
    fi
}

install_supervisor () {
    print "Installing Supervisor..."
    apt_install supervisor
    print "${SYMBOL_OK} Supervisor installed."
}

is_git_installed () {
    if command -v git >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_git () {
    print "Installing git..."
    apt_install git
    print ${SYMBOL_OK} "Git installed."
}

prompt_yn () {
    message=$1
    
    while true; do
        read -p "$message (y/n): " yn

        case $yn in
            [Yy]* ) echo "true"; exit;;
            [Nn]* ) echo "false"; exit;;
        esac
    done
}

prompt_installation_yn () {
    local service=$1
    
    prompt_yn "$service is not installed. Would you like to install it? (y/n)"
}

install_services () {
    print "Installing missing services..."
    
    if ! $(is_nginx_installed) -eq "true"; then
        install_nginx
    fi

    if ! $(is_supervisor_installed) -eq "true"; then
        install_supervisor
    fi

    if ! $(is_git_installed) -eq "true"; then
        install_git
    fi

    print "${SYMBOL_OK} All services has been installed."
}

verify_service () {
    local service=$2
    local condition=$1
    if "$condition" -eq "true"; then
        print "  ${SYMBOL_OK} $service"
    else
        print "  ${SYMBOL_ERROR} $service"
    fi
}

verify_services () {
    print "Services:"

    verify_service "$(is_nginx_installed)" "Nginx"
    verify_service "$(is_supervisor_installed)" "Supervisor"
    verify_service "$(is_git_installed)" "Git"
}

init_fs () {
    folder=$1

    mkdir -p $folder/services
    mkdir -p $folder/logs
    
    mkdir -p $folder/config
    mkdir -p $folder/config/nginx
    mkdir -p $folder/config/supervisor

    print "${SYMBOL_OK} File system initialized at $folder..."
}

#? Main
verify_services
install_services

init_fs /home/@coretools
init_admin_user
