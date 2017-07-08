#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Matt Schreck <mschreck@gmail.com>


# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [[ "$OSTYPE" == darwin* ]]; then
  alias v='mvim --remote-silent'
  alias casku='sudo -v; brew cask outdated | xargs -L1 brew cask reinstall'
fi


# these change the cursor on the command line based on vi mode
# should figure out some way to port this to my own theme

# \e[0 q or \e[ q: reset to whatever's defined in the profile settings
# \e[1 q: blinking block
# \e[2 q: steady block
# \e[3 q: blinking underline
# \e[4 q: steady underline
# \e[5 q: blinking I-beam
# \e[6 q: steady I-beam
#function zle-keymap-select {
#    if [ "$TERM" = "xterm-256color" ]; then
#        if [ $KEYMAP = vicmd ]; then
#            # the command mode for vi
#            echo -ne "\e[1 q"
#        else
#            # the insert mode for vi
#            echo -ne "\e[5 q"
#        fi
#    fi
#}
#
#zle-line-finish zle-line-init() 
#{
#  echo -ne "\e[5 q"
#}
