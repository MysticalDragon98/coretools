set_user_as_sudoer () {
    local user=$1
    local sudoers_file="/etc/sudoers.d/admin"

    append $sudoers_file "$user ALL=(ALL) NOPASSWD:ALL"
}