ramsey's dotfiles
-----------------

Get the source:

`git clone git@github.com:ramsey/dotfiles.git .dotfiles`

Install RVM:

`bash -s stable < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer)`

Install the dotfiles:

`cd .dotfiles && rake install`

Change your shell:

`chsh -s /bin/zsh`

Log out and log back in. Boom!
