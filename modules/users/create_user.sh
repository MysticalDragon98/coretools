create_user () {
    user=$1
    password=$2

    useradd $user

    echo $password | passwd $user --stdin
}