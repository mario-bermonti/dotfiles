#######################
# Emacs #
#######################

# syslink emacs dir and open in it
alias emacsv="ln -fsv ~/.dotfiles/emacs/emacs-config/.emacs.d/ ~/.emacs.d; rm ~/.spacemacs"

# syslink spacemacs dir and open in it
alias spacemacs="ln -fsv ~/.dotfiles/spacemacs/.emacs.d/ ~/.emacs.d; ln -fsv ~/.dotfiles/spacemacs/.spacemacs ~/"


#######################
# Aliases for commonly visited dir
#######################
# research projects
alias gotodiss="cd ~/Box\ Sync/Research/Research\ Projects/Disertación\ \(DeMo\)"

#######################
# python
#######################
# export PYTHONPATH="~/Library/Python/3.7/bin"

# aliases for making things easier
alias pythontest="python -m pytest"


# config tkinter to work with pyenv's pythons
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

export PATH="$HOME/.pyenv/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    if [ -z "$PYENV_INITIALIZED" ]; then
        eval "$(pyenv init -)"
        export PYENV_INITIALIZED=1
    fi
fi

#######################
# poetry
#######################
export PATH="$HOME/.poetry/bin:$PATH"

# aliases for make running python through poetry easier
alias pythonp="poetry run python"
alias invokep="poetry run invoke"
alias pytestp="poetry run pytest"


#######################
# Ruby
#######################
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH" 


