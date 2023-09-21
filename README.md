# enzuru's home directory

This is my home directory on [GNU Guix](https://guix.gnu.org/); my dotfiles, scripts, and Lisp code for [StumpWM](https://stumpwm.github.io), [SBCL](https://www.sbcl.org/), [Slynk](https://github.com/joaotavora/sly), [Shepherd](https://www.gnu.org/software/shepherd), etc.

## StumpWM

I try to have keystrokes that simulate Emacs and [Tmux](https://en.wikipedia.org/wiki/Tmux) in order to reduce the learning curve. All keystrokes are preceded by `C-t`.

### Help

- `?` get help
- `:` eval some Lisp
- `g` cancel

### Programs

- `E` new emacs instance
- `e` new emacsclient
- `f` new [mc](https://midnight-commander.org)

### Windows

- `b` select window by name
- `left` previous window
- `right` next window

### Groups

- `c` create a new group
- `n` next group
- `p` previous group
- `&` kill group and its windows

### Frames

- `o` move to next frame
- `%` horizontal split and new term
- `"` vertical split and new term
- `x` kill and remove split

## Supported platforms

- Guix 1.3
- Guix 1.4

## License

Licensed under the GPLv3; copyright is assigned to my eponymous nonprofit [enzu.ru](https://enzu.ru)
