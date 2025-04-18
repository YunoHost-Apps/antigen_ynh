# Antigen loader wich created default antigen configuration
# https://github.com/zsh-users/antigen
source /usr/share/zsh-antigen/antigen.zsh

if [ ! -f "$HOME/.antigenrc" ]; then
   echo "File $HOME/.antigenrc not found. Using default antigen config /etc/antigenrc"
   echo "If you want to use your specific antigen config, just copy /etc/antigenrc file to $HOME/.antigenrc and modify it as your wishes"
   ln -sfn /etc/antigenrc "$HOME/.antigenrc"
fi

antigen init "$HOME/.antigenrc"
