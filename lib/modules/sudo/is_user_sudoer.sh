is_user_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    if [ -f $sudoers_file ]; then
        local sudoers=$(sudo cat $sudoers_file | grep $user)
        
        if [ -n "$sudoers" ]; then
            echo "false"
        else
            echo "true"
        fi
    else
        echo "false"
    fi
}