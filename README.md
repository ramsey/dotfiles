ramsey's dotfiles
-----------------

Install dependencies (I use this on Ubuntu; your command may differ):

```
sudo aptitude install git zsh rake python-pip
pip install --user git+git://github.com/Lokaltog/powerline
```

Ensure the host system running the terminal emulator has the Meslo font installed
(for use with Powerline): https://github.com/Lokaltog/powerline-fonts

Get the source:

`git clone git://github.com/ramsey/dotfiles.git .dotfiles`

Install the dotfiles:

`cd .dotfiles && rake install`

Change your shell:

`chsh -s /bin/zsh`

Log out and log back in. Boom!
