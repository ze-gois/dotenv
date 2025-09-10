#!/usr/bin/env sh

prompt_pass() {
    keyword="$1"
    prompt="$2"
    env_var="$3"

    # Only use env_var if it is set AND not empty
    if [ -n "${env_var}" ]; then
        echo "$prompt found in environment: $env_var"
        echo "$env_var" | pass insert -m -f "$keyword" 1>/dev/null
        echo "$prompt saved from environment!"
        return
    fi

    # Check if already in pass
    if pass show "$keyword" &>/dev/null; then
        echo "$prompt: $(pass show "$keyword")"
        read -p "Keep this value? y/[N]: " yn
        yn=${yn:-N}
        [ "$yn" = "y" ] || [ "$yn" = "Y" ] && return
    fi

    # Interactive fallback
    read -p "Enter $prompt: " value
    echo "$value" | pass insert -m -f "$keyword" 1>/dev/null
    echo "$prompt saved!"
}
