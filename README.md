# Ranger & Zoxide

This plugin is a successor to [Ranger & Autojump](https://github.com/fdw/ranger-autojump), but with [zoxide](https://github.com/ajeetdsouza/zoxide) replacing [autojump](https://github.com/wting/autojump).

It adds complete support for zoxide to [ranger](https://github.com/ranger/ranger): Whenever a new directory is opened in ranger, zoxide is notified and can change the weights accordingly.
Using `:z` you can use zoxide to jump to a directory. This is made even better by adding `map cj console j%space` to your `rc.conf`. Thus typing `cj dirname` will let you jump to dirname.

As an added bonus, there is a zsh plugin introducing a new function called `r`. Without arguments, it just opens ranger. If you supply an argument that is a directory, ranger is opened in that directory. But if you supply anything else as an argument, `zoxide` is called with the argument and `ranger` is opened there 🧙

## Installation
### Ranger plugin
Copy `zoxide.py` to `${XDG_CONFIG_HOME}/ranger/plugins`.

### zsh plugin
Install the zsh plugin using your favorite plugin manager, for example [zgen](https://github.com/tarjoilija/zgen): `zgen load fdw/ranger_zoxide`

## Why not use the ranger plugin form zoxide?
First, this repo also adds the zsh plugin to more easily start ranger.
Secondly, the zoxide package from my distribution did not contain the ranger plugin, so re-using my old plugin was just sensible.
