#? 1. Imports
##? 1.1 Constants
    . ./consts/colors.const.sh
    . ./consts/styles.const.sh
    . ./consts/symbols.const.sh
    . ./consts/files.const.sh
    . ./consts/paths.const.sh
##? 1.2 Modules
###? 1.2.1 Stdout
    . ./modules/stdout/print.sh
###? 1.2.2 Apt
    . ./modules/apt/apt_update.sh
    . ./modules/apt/apt_install.sh
###? 1.2.3 Nginx
    . ./modules/install/nginx.install.sh
    . ./modules/install/supervisor.install.sh
    . ./modules/install/git.install.sh
    . ./modules/install/node.install.sh
    . ./modules/install/snap.install.sh
    . ./modules/install/certbot.install.sh
###? 1.2.4 Prompts
    . ./modules/prompts/prompt_yn.sh
    . ./modules/prompts/prompt_installation_yn.sh
###? 1.2.5 Services
    . ./modules/services/install_services.sh
    . ./modules/services/verify_service.sh
    . ./modules/services/verify_services.sh
###? 1.2.6 FS
    . ./modules/fs/init_fs.sh
###? 1.2.7 Users
    . ./modules/users/create_user.sh
    . ./modules/users/exists_user.sh
    . ./modules/users/init_admin_bashrc.sh
    . ./modules/users/init_admin_user.sh

#? Main
verify_services
install_services

init_fs $BASE_PATH
init_admin_user admin