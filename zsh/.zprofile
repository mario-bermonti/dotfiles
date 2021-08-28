#######################
# Emacs #
#######################

# syslink emacs dir and open in it
alias emacsv="ln -fsv ~/programming_projects/dotfiles/emacs/emacs-config/.emacs.d/ ~/.emacs.d; rm ~/.spacemacs"

# syslink spacemacs dir and open in it
alias spacemacs="ln -fsv ~/programming_projects/dotfiles/spacemacs/.emacs.d/ ~/; ln -fsv ~/programming_projects/dotfiles/spacemacs/.spacemacs ~/"


#######################
# Aliases for commonly visited dir
#######################

# research projects

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

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

################################################
# # old config                                 #
# # if command -v pyenv 1>/dev/null 2>&1; then #
# #     if [ -z "$PYENV_INITIALIZED" ]; then   #
# #         eval "$(pyenv init -)"             #
# #         export PYENV_INITIALIZED=1         #
# #     fi                                     #
# # fi                                         #
################################################

#######################
# poetry
#######################
export PATH="$HOME/.poetry/bin:$PATH"

# aliases for running python through poetry easier
alias prp="poetry run python"
alias pri="poetry run invoke"
alias prpy="poetry run pytest"
alias pit="poetry run invoke tests"
alias pil="poetry run invoke lint"
alias pic="poetry run invoke coverage"
alias pif="poetry run invoke format"
alias pim="poetry run invoke mypy"
alias pih="poetry run invoke hooks"
alias pid="poetry run invoke docs"
alias pidt="poetry run invoke dev-tasks"
alias piv="poetry run invoke version"
alias picl="poetry run invoke clean"

# cookicutter template
alias pibc="poetry run cookiecutter --no-input --overwrite-if-exists -o ~/Downloads/ ."

#######################
# Ruby
#######################
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH"
