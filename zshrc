# use .localrc for settings specific to one system
[[ -f ~/.localrc ]] && . ~/.localrc

. ~/.zsh/config
. ~/.zsh/aliases
. ~/.zsh/completion

# use .localrc-post for settings specific to one system
# that should be loaded after everything else has loaded
[[ -f ~/.localrc-post ]] && . ~/.localrc-post

#### FIG ENV VARIABLES ####
[[ -s ~/.fig/fig.sh ]] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
