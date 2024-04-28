exists_user () {
    $user=$1

    if id -u $user >/dev/null 2>&1; then
        echo "true"
    else
        echo "false"
    fi
}