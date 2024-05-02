verify_coretools () {
    print "Coretools:"

    verify_coretool "$(is_scripts_installed)" "Bash Scripts"
    verify_coretool "$(is_bin_installed)" "Bin"
}