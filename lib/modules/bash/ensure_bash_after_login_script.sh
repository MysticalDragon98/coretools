ensure_bash_after_login_script () {
    local bash_script="/etc/bash.bashrc"
    local bash_script_content=$(cat $bash_script | grep "sh $AFTER_LOGIN_SCRIPT_PATH")

    if [ -z "$bash_script_content" ]; then
        sudo echo "sh $AFTER_LOGIN_SCRIPT_PATH" | sudo tee -a $bash_script > /dev/null
    fi
}