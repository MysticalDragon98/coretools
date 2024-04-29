is_user_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    if [ -f $sudoers_file ]; then
        local sudoers=$(sudo cat $sudoers_file | grep $user)
        
        if "$sudoers" -eq "$user ALL=(ALL) NOPASSWD:ALL"; then
            echo "true"
        else
            echo "false"
        fi
    else
        echo "false"
    fi
}