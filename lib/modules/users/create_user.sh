create_user () {
    user=$1

    sudo useradd --shell /bin/bash $user
    sudo mkdir /home/$user

    sudo mkdir -p /home/$user/.ssh
    sudo chown -R $user:$user /home/$user
}