BASE_PATH=/home/admin
SCRIPTS_PATH=$BASE_PATH/.scripts
AFTER_LOGIN_SCRIPT_PATH=$SCRIPTS_PATH/after-login.sh

ensure_bash_after_login_script () {
    local bash_script="/etc/bash.bashrc"
    local bash_script_content=$(cat $bash_script | grep "sh $AFTER_LOGIN_SCRIPT_PATH")

    if [ -z "$bash_script_content" ]; then
        echo "Bash after login script not found"
        sudo echo "sh $AFTER_LOGIN_SCRIPT_PATH" | sudo tee -a $bash_script > /dev/null
    fi

    echo "Bash after login script ensured"
}