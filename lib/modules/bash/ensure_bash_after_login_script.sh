ensure_bash_after_login_script () {
    local bash_script="/etc/bash.bashrc"
    local bash_script_content=$(cat $bash_script | grep "sh $AFTER_LOGIN_SCRIPT_PATH")

    if [ -z "$bash_script_content" ]; then
        append "$bash_script" "sh $AFTER_LOGIN_SCRIPT_PATH"
    fi
}