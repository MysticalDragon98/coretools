verify_service () {
    local service=$2
    local condition=$1
    if "$condition" -eq "true"; then
        print "  ${SYMBOL_OK} $service"
    else
        print "  ${SYMBOL_ERROR} $service"
    fi
}