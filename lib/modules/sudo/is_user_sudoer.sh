is_user_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    if [ -f $sudoers_file ]; then
        local sudoers=$(sudo cat $sudoers_file | grep $user | tr -d '[:space:]')
        if [ "$sudoers" == "$user ALL=(ALL) NOPASSWD:ALL" ]; then
            return "true"
        fi
    fi

    return "false"
}