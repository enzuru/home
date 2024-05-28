# enzuru's home directory

This is my home directory for POSIX operating systems; my dotfiles, scripts, configuration, and Lisp code for [StumpWM](https://stumpwm.github.io), [SBCL](https://www.sbcl.org/), [Slynk](https://github.com/joaotavora/sly), etc. It tries to be mostly distro and OS agnostic.

## StumpWM

I try to have keystrokes that simulate Emacs and [tmux](https://github.com/tmux/tmux/wiki) in order to reduce the learning curve. All keystrokes are preceded by `C-t`.

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

- `C-n` select group by name
- `c` create a new group
- `n` next group
- `p` previous group
- `&` kill group and its windows
- 
### Frames

- `o` move to next frame
- `"` or `2` vertical split and new term
- `%` or `3` horizontal split and new term
- `x` kill and remove split

## Supported platforms

- Guix 1.3
- Guix 1.4

## License

Licensed under the GPLv3; copyright is assigned to my eponymous charity [enzu.ru](https://enzu.ru)
