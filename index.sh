. ./lib/consts/colors.const.sh
. ./lib/consts/styles.const.sh
. ./lib/consts/symbols.const.sh
. ./lib/consts/files.const.sh
. ./lib/consts/paths.const.sh
. ./lib/consts/repos.const.sh
. ./lib/modules/stdout/print.sh
. ./lib/modules/apt/apt_update.sh
. ./lib/modules/apt/apt_install.sh
. ./lib/modules/install/nginx.install.sh
. ./lib/modules/install/supervisor.install.sh
. ./lib/modules/install/git.install.sh
. ./lib/modules/install/node.install.sh
. ./lib/modules/install/yarn.install.sh
. ./lib/modules/install/ts-node.install.sh
. ./lib/modules/install/snap.install.sh
. ./lib/modules/install/certbot.install.sh
. ./lib/modules/prompts/prompt_yn.sh
. ./lib/modules/prompts/prompt_installation_yn.sh
. ./lib/modules/services/install_services.sh
. ./lib/modules/services/verify_service.sh
. ./lib/modules/services/verify_services.sh
. ./lib/modules/fs/init_fs.sh
. ./lib/modules/users/create_user.sh
. ./lib/modules/users/exists_user.sh
. ./lib/modules/users/init_admin_bashrc.sh
. ./lib/modules/users/init_admin_user.sh
. ./lib/modules/sudo/set_user_as_sudoer.sh
. ./lib/modules/sudo/is_user_sudoer.sh
. ./lib/modules/users/ensure_admin_sudo.sh
. ./lib/modules/coretools/scripts.install.sh
. ./lib/modules/coretools/install_coretools.sh
. ./lib/modules/coretools/verify_coretools.sh
. ./lib/modules/coretools/verify_coretool.sh
. ./lib/modules/bash/ensure_bash_after_login_script.sh
. ./lib/modules/users/set_user.sh
#* Imports


#? Main
verify_services
install_services

init_fs $BASE_PATH

init_admin_user admin
set_user admin

verify_coretools
install_coretools