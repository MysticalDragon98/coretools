ADMIN_USER_VAR=admin

COLOR_GREEN='\033[38;5;118m'
COLOR_RED='\033[38;5;196m'
COLOR_BLUE='\033[38;5;39m'

STYLE_NONE="\033[0m"

SYMBOL_OK=$COLOR_GREEN'✔'$STYLE_NONE
SYMBOL_ERROR=$COLOR_RED'✖'$STYLE_NONE
SYMBOL_QUESTION=$COLOR_BLUE'?'$STYLE_NONE

FILE_BASHRC="https://raw.githubusercontent.com/MysticalDragon98/coretools/master/files/.bashrc?token=$(date +%s)"
FILE_PROFILE="https://raw.githubusercontent.com/MysticalDragon98/coretools/master/files/.profile?token=$(date +%s)"

BASE_PATH=/home/$ADMIN_USER_VAR
SCRIPTS_PATH=$BASE_PATH/.scripts
AFTER_LOGIN_SCRIPT_PATH=$SCRIPTS_PATH/after-login.sh

SCRIPTS_REPO=https://github.com/MysticalDragon98/coretools-scripts

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

is_jq_installed () {
    if command -v jq >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_jq () {
    print "Installing jq..."
    apt_install jq
    print ${SYMBOL_OK} "JQ installed."
}

is_node_installed () {
    if command -v node >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_node () {
    print "Installing node..."
    curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
    apt_install nodejs
    print ${SYMBOL_OK} "NodeJS installed."
}

is_yarn_installed () {
    if command -v yarn >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_yarn () {
    print "Installing yarn..."
    sudo npm i -g yarn
    print ${SYMBOL_OK} "Yarn installed."
}

is_tsnode_installed () {
    if command -v ts-node >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_tsnode () {
    print "Installing TS Node..."
    sudo npm i -g ts-node typescript @types/node
    print ${SYMBOL_OK} "TS Node installed."
}

is_snap_installed () {
    if command -v snap >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_snap () {
    print "Installing snap..."
    apt_install snapd
    print ${SYMBOL_OK} "Snap installed."
}

is_certbot_installed () {
    if command -v certbot >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_certbot () {
    print "Installing certbot..."
    sudo snap install --classic certbot
    sudo ln -s /snap/bin/certbot /usr/bin/certbot
    print ${SYMBOL_OK} "Certbot installed."
}

is_sysstat_installed () {
    if command -v mpstat >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

install_sysstat () {
    print "Installing sysstat..."
    apt_install sysstat
    print ${SYMBOL_OK} "Sysstat installed."
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

    if ! $(is_node_installed) -eq "true"; then
        install_node
    fi

    if ! $(is_yarn_installed) -eq "true"; then
        install_yarn
    fi

    if ! $(is_tsnode_installed) -eq "true"; then
        install_tsnode
    fi

    if ! $(is_snap_installed) -eq "true"; then
        install_snap
    fi

    if ! $(is_certbot_installed) -eq "true"; then
        install_certbot
    fi

    if ! $(is_jq_installed) -eq "true"; then
        install_jq
    fi

    if ! $(is_sysstat_installed) -eq "true"; then
        install_sysstat
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
    verify_service "$(is_node_installed)" "NodeJS"
    verify_service "$(is_yarn_installed)" "Yarn"
    verify_service "$(is_tsnode_installed)" "TS Node"
    verify_service "$(is_snap_installed)" "Snap"
    verify_service "$(is_certbot_installed)" "Certbot"
    verify_service "$(is_jq_installed)" "JQ"
    verify_service "$(is_sysstat_installed)" "JQ"
}

init_fs () {
    folder=$1

    mkdir -p $folder/.bin
    mkdir -p $folder/services
    mkdir -p $folder/logs
    
    mkdir -p $folder/config
    mkdir -p $folder/config/nginx
    mkdir -p $folder/config/supervisor

    print "${SYMBOL_OK} File system initialized at $folder..."
}

create_user () {
    user=$1

    sudo useradd --shell /bin/bash $user
    sudo mkdir /home/$user

    sudo chown -R $user:$user /home/$user
    sudo mkdir -p /home/$user/.ssh
}

exists_user () {
    user=$1

    if id -u $user >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}

init_admin_bashrc () {
    local user=$1

    if [ -f "$BASE_PATH/.bashrc" ]; then
        print ${SYMBOL_OK} "Admin user .bashrc is setup"
    else
        print "Setting up admin user .bashrc..."
        
        sudo curl -s $FILE_BASHRC > $BASE_PATH/.bashrc

        print ${SYMBOL_OK} "Admin user .bashrc setup."
    fi

    if [ -f "$BASE_PATH/.profile" ]; then
        print ${SYMBOL_OK} "Admin user .profile is setup"
    else
        print "Setting up admin user .profile..."
        
        sudo curl -s $FILE_PROFILE > $BASE_PATH/.profile

        print ${SYMBOL_OK} "Admin user .profile setup."
    fi
}

init_admin_user () {
    local user=$1

    if $(exists_user $user) -eq "true"; then
        print ${SYMBOL_OK} "Admin user $user is setup"
    else
        print "Creating admin user..."
        create_user $user
        print ${SYMBOL_OK} "Admin user $user created."
    fi

    init_admin_bashrc $user
    ensure_admin_sudo $user
}

set_user_as_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    sudo echo "$user ALL=(ALL) NOPASSWD:ALL" > $sudoers_file
}

is_user_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    if [ -f $sudoers_file ]; then
        local sudoers=$(sudo cat $sudoers_file | grep $user)
        
        if [ -n "$sudoers" ]; then
            echo "true"
        else
            echo "false"
        fi
    else
        echo "false"
    fi
}

ensure_admin_sudo () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    if $(is_user_sudoer $user) -eq "true"; then
        print ${SYMBOL_OK} "Admin user $user is a sudoer"
    else
        print "Setting $user as a sudoer..."
        set_user_as_sudoer $user
        print ${SYMBOL_OK} "Admin user $user is now a sudoer."
    fi
}

is_scripts_installed () {
    if [ -d $SCRIPTS_PATH ]; then
        echo "true"
    else
        echo "false"
    fi
}

install_scripts () {
    sudo git clone $SCRIPTS_REPO $SCRIPTS_PATH
    sudo chown -R $ADMIN_USER_VAR:$ADMIN_USER_VAR $SCRIPTS_PATH
    
    ensure_bash_after_login_script
}

install_coretools () {
    if ! $(is_scripts_installed) -eq "true"; then
        install_scripts
    fi
}

verify_coretools () {
    print "Coretools:"

    verify_coretool "$(is_scripts_installed)" "Bash Scripts"
}

verify_coretool () {
    local service=$2
    local condition=$1
    
    if "$condition" -eq "true"; then
        print "  ${SYMBOL_OK} $service"
    else
        print "  ${SYMBOL_ERROR} $service"
    fi
}

ensure_bash_after_login_script () {
    local bash_script="/etc/bash.bashrc"
    local bash_script_content=$(cat $bash_script | grep "sh $AFTER_LOGIN_SCRIPT_PATH")

    if [ -z "$bash_script_content" ]; then
        sudo echo "sh $AFTER_LOGIN_SCRIPT_PATH" | sudo tee -a $bash_script > /dev/null
    fi
}

#? Main
verify_services
install_services

init_fs $BASE_PATH
init_admin_user admin

verify_coretools
install_coretools
