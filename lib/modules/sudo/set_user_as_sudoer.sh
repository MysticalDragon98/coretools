set_user_as_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    sudo echo "$user ALL=(ALL) NOPASSWD:ALL" > $sudoers_file
}