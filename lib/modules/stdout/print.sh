print () {
    local message="$@"

    printf "${message}${STYLE_NONE}\n"
}