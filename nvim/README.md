# Personal Neovim Config

This is the personal Neovim config of *Mark Bromell*.

I have found myself in a loop of configuring, it has helped me learn a lot and it has been fun... but it has to stop. My goal is to create projects that bring value to the world, and finding myself constantly tweaking Neovim is counter productive to that goal. Some tweaking is a necessary evil and can lead to positive results. But when I do enter into my config, I need to have guiding principals to get back out of it as fast as possible.

My config is structured to align with my motivation to stay out of the loop of configuring, and this readme outlines the details of the structure. This may or may not make sense to you, and it may not apply to you, but that is okay and you can safely move on from here. But if what I have said resonates with you so far, I believe this is the cure.

## Principles

- If it is not broken, stay away.
- If it does not cause pain, stay away.
- If you ponder the need for it; you do not need it.
- If you do not use it, remove it.
- Perfect does not exist.

## Structure

It all starts in the [init.lua](init.lua) file. I use [lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management as it results in the most simple way of organising my config. It just works and it makes sense, I do not need to look at any other plugin manager.

I use the [Filetype](https://neovim.io/doc/user/filetype.html) builtin plugin for configuration that I want to execute when entering specific file type buffers -- these configs are in [after/ftplugin/](./after/ftplugin/). These configs should be *tiny* and *simple*.

In the [lua/custom/](./lua/custom/) directory, this is where the rest of the configuration lives for Neovim and plugins. The first directory is [lua/custom/config/](./lua/custom/config/) -- which simply configures Neovim itself. For the plugin configuration I initially just had a single large `plugins/` directory, but I wanted to design a system that helps guide me away from ever entering (or staying inside) the plugin configs.

### [**lua/custom/core/**](./lua/custom/core/)

Plugins that are essential for making Neovim usable. I should almost never **add** or **remove** in this directory, because they are already setup and I consider them to be *"forever features"* for any IDE. In the future if something breaks or drops support, then I may **edit** or **replace** those configs in this directory without hesitation.

- Each file in this directory can contain 1 or more plugin specs. The files should be named after the feature it is implementing, but can also be named after a plugin if the plugin is ubiquitous.

### [**lua/custom/extra/**](./lua/custom/extra/)

Plugins that are only complementary features for using Neovim. I should almost never **add** or **edit** in this directory, because they are not truly essential to be able to get work done. So spending too much time here is probably not that valuable, I need a really good reason to spend time in this directory. If I ever want to **remove** from this directory, then I should do so without hesitation.

If I ever see a plugin and think "oh that looks cool", then I need to stop myself right away. Ideally I would only ever add to this directory when I find myself frequently bumping into awkward issues that slow me down -- if I find or know about a plugin that solves that exact issue, then **add** to this directory without hesitation

- Each file in this directory should contain a single plugin spec.
- The files should be named after the plugin that it is configuring.

### [**lua/custom/vendor/**](./lua/custom/vendor/)

Plugins that are for specific tools or technologies. I should **add** and **remove** in this directory without hesitation as I adopt or drop usage for tools / technology. But similar to [**lua/custom/extra/**](./lua/custom/extra/) -- when making an **edit** I need a good reason to spend time here, time in this directory should be quick in and quick out.

- Each file in this directory can contain many plugin specs.
- The files should have a name after the tool / technology that it supports.
