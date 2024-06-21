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
[lua/custom/config/](./lua/custom/config/) -- is simply configs for Neovim
itself. You will see 3 other directories inside here, initially I just had a
single large `plugins/` directory for plugins, but I wanted to get better
visibilty on the reasons for certain plugins.

### [**lua/custom/core/**](./lua/custom/core/)

Plugins that are essential for making Neovim usable. I should almost never
**add** or **remove** in this directory, because they are already setup and I
consider them to be *"forever features"* for any IDE. In the future if something
breaks or drops support, then I may **edit** or **replace** those configs in
this directory without hesitation.

- Each file in this directory can contain 1 or more plugin specs.
- The files should be named after the feature it is implementing, but can also
  be named after a plugin if the plugin is ubiquitous.

### [**lua/custom/extra/**](./lua/custom/extra/)

Plugins that are only complementary features for using Neovim. I should almost
never **add** or **edit** in this directory, because they are not truly
essential to be able to get work done. So spending too much time here is
probably not that valuable, I need a really good reason to spend time in this
directory. If I ever want to **remove** from this directory, then I should do so
without hesitation.

If I ever see a plugin and think "oh that looks cool", then I need to stop
myself right away. Ideally I would only ever add to this directory when I find
myself frequently bumping into awkward issues that slow me down -- if I find or
know about a plugin that solves that exact issue, then **add** to this directory
without hesitation

- Each file in this directory should contain a single plugin spec.
- The files should be named after the plugin that it is configuring.

### [**lua/custom/vendor/**](./lua/custom/vendor/)

Plugins that are needed for specific tools or technologies. I should **add** and
**remove** in this directory without hesitation as I adopt or drop usage for
tools / techology. But similar to [**lua/custom/extra/**](./lua/custom/extra/)
-- when making an **edit** I need a good reason to spend time here, time in this
directory should be quick in and quick out.

- Each file in this directory can contain many plugin specs.
- The files should be named after the tool / technology that it supports.
