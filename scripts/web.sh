#!/usr/bin/env bash

main() {
    local py_pid;

    python3 -m http.server 8001 --bind 127.0.0.1 &
    py_pid="$!"
    trap "printf 'Stopping server...'; kill $py_pid" EXIT
    sleep 1

    open 'http://localhost:8001'
    printf 'Kill server?: [a-z]'
    read
}
main "$@"
