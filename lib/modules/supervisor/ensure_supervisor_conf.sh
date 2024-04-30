ensure_supervisor_conf () {
    if $(ensure_line /etc/supervisor/supervisord.conf "files = $SUPERVISOR_PATH" "Adding supervisor configuration path to supervisord.conf") -eq "true"; then
        supervisorctl reread
        supervisorctl update
    fi
}