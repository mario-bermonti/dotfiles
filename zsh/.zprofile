#######################
# aliases #
#######################
# syslink emacs dir and open in it
alias emacsv="ln -fsv ~/.dotfiles/emacs/emacs-config/.emacs.d/ ~/.emacs.d; rm ~/.spacemacs"

# syslink spacemacs dir and open in it
alias spacemacs="ln -fsv ~/.dotfiles/spacemacs/.emacs.d/ ~/.emacs.d; ln -fsv ~/.dotfiles/spacemacs/.spacemacs ~/"

#######################
# Commonly visited dir
#######################
# research projects
alias gotodiss="cd ~/Box\ Sync/Research/Research\ Projects/Disertación\ \(DeMo\)"

#######################
# python
#######################
# export PYTHONPATH="~/Library/Python/3.7/bin"

# config tkinter to work with pyenv's pythons
export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

#######################
# Ruby
#######################
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH" 

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
