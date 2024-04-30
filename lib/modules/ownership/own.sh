own () {
    local path=$1

    sudo chown -R $ADMIN_USER_VAR:$ADMIN_USER_VAR $path
}