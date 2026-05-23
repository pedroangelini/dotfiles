# Go Lang configs
if [ -f ~/.config/.gorc ]; then
    . ~/.config/.gorc
fi

# pyenv configs
if command -v pyenv >/dev/null 2>&1 && [ -d "$HOME/.pyenv" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

# cargo
if command -v cargo >/dev/null 2>&1 && [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

# nvm
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# fzf
if command -v fzf >/dev/null 2>&1; then
    if [ -n "$ZSH_VERSION" ]; then
        source <(fzf --zsh)
    elif [ -n "$BASH_VERSION" ]; then
        source <(fzf --bash)
    fi
    
    if [ -f "$HOME/.config/fzfconfigs.sh" ]; then
        . "$HOME/.config/fzfconfigs.sh"
    fi
fi