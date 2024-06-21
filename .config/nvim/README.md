# My Neovim config

This config is custom, it may or may not work on your machine if you decide to
try and use it. This readme is mainly for my own future reference.

## File structure

It all starts in the [init.lua](init.lua) file, currently I am using
[lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management as it
results in the most simple way of organising my config.

I use [Filetype](https://neovim.io/doc/user/filetype.html) detection for
configuration that I want to execute when entering specific file type buffers --
these configs are in [after/ftplugin/](./after/ftplugin/).

In the [lua/custom/](./lua/custom/) directory, this is where the rest of the
configuration lives for Neovim and plugins. The first directory is
[lua/custom/config/](./lua/custom/config/) -- this is simply configs for Neovim
itself. You will see 3 other directories inside here, initially I just had a
single large `plugins/` directory for plugins, but I wanted to get better
visibilty on the priority of the plugins. This helps align my own expectations
on how often I should be messing around with my configs, and reminds me to ask
myself to come up with a good "why" for making new edits to the config.

- [**lua/custom/core/**](./lua/custom/core/): Plugins that are essential for
  making Neovim usable. I should almost never *add*, *remove* in this directory,
  because they are already setup and I consider them to be "forever features"
  for any IDE. In the future if something breaks or drops support, then I may
  *edit* or *replace* certain configs here.
- [**lua/custom/extra/**](./lua/custom/extra/): Plugins that are only
  complementary features for using Neovim. I should almost never *add* or *edit*
  in this directory, because they are not truly essential to be able to get work
  done. So spending too much time here probably is not that valuable, I need a
  really good "why" to spend time in this directory. If I ever want to *remove*
  from this directory then I can do so without hesitation.
- [**lua/custom/vendor/**](./lua/custom/vendor/): Plugins that are useful for
  specific technologies or areas of development. The same sentiment applies to
  this directory as the [**lua/custom/extra/**](./lua/custom/extra/) directory.
  If I ever take on a project involving technolgoies or tools, that also needs
  plugins specifically for the tech or tools; then make a new file here for
  those plugins.
