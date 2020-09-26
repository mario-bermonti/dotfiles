# install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install and config tkinter so it's used by pyenv
echo 'export PATH="/usr/local/opt/tcl-tk/bin:$PATH"' >> ~/.zshrc
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"

# install pyenv
brew install pyenv
pyenv install 3.8.0
pyenv global 3.8.0
pyenv version
echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zprofile
source ~/.zprofile
echo "make sure everything worked"
which python3
python -V

# update pip
python3 -m pip install --upgrade pip

# Python packages that need to be available system wide
# stats
python3 -m pip install pandas matplotlib seaborn statsmodels numpy tabulate
python3 -m pip install ipython jupyter pyreadstat xlrd openpyxl janitor

# gui dev
python3 -m pip install kivy

# research
python3 -m pip install psychopy
# if the above option doesn't work, it can be installed with brew
# brew cask install psychopy

# Depdendencies needed for pyspell
python3 -m pip install pillow pygame pandas xlrd openpyxl

# Depdendencies needed for Ordenamiento de Letras
python3 -m pip install pillow pygame 
