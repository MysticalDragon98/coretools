create_user () {
    user=$1
    password=$2

    sudo useradd $user
}