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
alias gotosuicide="cd ~/Box\ Sync/PHSU/Design\ and\ stats\ consultation/Eliut\ Rivera/Suicide\ and\ Emotional\ Regulation\ Project"
alias gotoensc="cd ~/Ponce\ Health\ Sciences\ University/Evidence\ computer-assisted\ reading\ interventions\ -\ Documentos"
alias gotoensc="cd ~/Ponce\ Health\ Sciences\ University/Evidence\ computer-assisted\ reading\ interventions\ -\ Documentos"

# programming projects
alias gotopythonpractice="cd ~/programming_practice/python_practice/"
alias gotopyspell="cd ~/programming_projects/pyspell/pyspell"
alias gotoint="cd ~/programming_projects/Intervencion"
alias gotoapa="cd ~/programming_projects/APA_self-study_evaluation_system"


#######################
# python
#######################
# export PYTHONPATH="~/Library/Python/3.7/bin"

#######################
# Ruby
#######################
export PATH="/usr/local/opt/ruby/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
export PATH="$HOME/.gem/ruby/2.7.0/bin:$PATH" 

