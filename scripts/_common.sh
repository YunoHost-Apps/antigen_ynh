#!/usr/bin/env bash

ANTIGEN_LOADER_SCRIPT="/usr/share/zsh-antigen/load-antigen.zsh"
ANTIGEN_DEFAULT_CONF="/etc/antigenrc"


# Configure zsh as default login shell for all users
_set_zsh_for_all_users() {
    local zsh_bin
    zsh_bin="$(which zsh)"
    if _is_zsh_for_all_users; then
        return 0
    fi
   
    echo "map passwd loginShell \"${zsh_bin}\"" >> "/etc/nslcd.conf"
    return 0
}

# Restore default login shell for al users
_unset_zsh_for_all_users() {
    local zsh_bin
    zsh_bin="$(which zsh)"
    if ! _is_zsh_for_all_users; then
        return 0
    fi

    sed -i "#map passwd loginShell \"${zsh_bin}\"#d" "/etc/zsh/zshrc"
    return 0
}

# Check if zsh is enabled for all users
_is_zsh_for_all_users() {
    local zsh_bin
    zsh_bin="$(which zsh)"
    if grep -q "map passwd loginShell \"${zsh_bin}\"" "/etc/nslcd.conf"; then
        return 0
    else
        return 1
    fi
}

# Configure zsh as default shell for root user
_set_zsh_for_root_user() {
    if _is_zsh_for_root_user; then
        return 0
    fi
   
    chsh -s "$(which zsh)" root
    return 0
}

# Restore bash shell for root
_unset_zsh_for_root_user() {
    if ! _is_zsh_for_root_user; then
        return 0
    fi

    chsh -s "$(which bash)" root
    return 0
}

# Check if zsh is enabled for root user
_is_zsh_for_root_user() {
    if grep "^root\:" /etc/passwd | grep -q "$(which zsh)"; then
        return 0
    else
        return 1
    fi
}


# Add loading antigen for zsh by default
_enable_loading_antigen_by_default() {

    if grep -q "source \"$ANTIGEN_LOADER_SCRIPT\"" "/etc/zsh/zshrc"; then
        return 0
    fi

    echo "source \"$ANTIGEN_LOADER_SCRIPT\"" >> "/etc/zsh/zshrc"
    return 0
}


# Delete loading antigen for zsh by default
_disable_loading_antigen_by_default() {
    if ! grep -q "source \"$ANTIGEN_LOADER_SCRIPT\"" "/etc/zsh/zshrc"; then
        return 0
    fi

    sed -i "#source \"$ANTIGEN_LOADER_SCRIPT\"#d" "/etc/zsh/zshrc"
    return 0
}
