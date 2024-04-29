ensure_bash_after_login_script () {
    local bash_script="/etc/bash.bashrc"
    local bash_script_content=$(cat $bash_script | grep "sh $BASH_AFTER_LOGIN_SCRIPT_PATH")

    if [ -z "$bash_script_content" ]; then
        sudo echo "\nsh $BASH_AFTER_LOGIN_SCRIPT_PATH" | sudo tee $bash_script > /dev/null
    fi
}