# AGENTS.md

Personal macOS dotfiles managed with GNU Stow. Cloned to `~/dotfiles` and symlinked
into `$HOME`. They are tuned for one person's machines (a personal Mac, a work
laptop, occasionally Windows/mingw), so they aren't meant to be portable.

## Layout

Every top-level **directory** is a stow package that mirrors `$HOME`.
`stow.sh` stows all of them, and top-level **files** are never stowed.

| Package | Deploys to | Notes |
|---|---|---|
| `home/` | `~/.zshrc`, `.bashrc`, `.gitconfig`, `.gitignore` (global excludes), `.ignore` (fd/rg), `.vimrc`, `.ideavimrc` | The empty `.stow-local-ignore` is intentional, see Gotchas |
| `personal/` | `~/.config/personal/` | `setup.sh` sources `exports.sh`, `functions.sh` and `aliases.sh`; `scripts/` is on PATH |
| `nvim/` | `~/.config/nvim/` | lazy.nvim; read `nvim/.config/nvim/README.md` before touching it |
| `zed/` | `~/.config/zed/{settings,keymap,tasks}.json` | Symlinked per file, because `~/.config/zed` is a real dir |
| `wezterm/` | `~/.config/wezterm/` | One Lua module per concern, each exposing `M.apply(config)` |
| `tmux/` | `~/.config/tmux/` | The plugins come from tpm in `~/.tmux/plugins`, **not** from `tmux/plugins/` |
| `starship/`, `lazygit/`, `bat/`, `yazi/` | `~/.config/...` | Small configs; yazi flavors are vendored |

Top-level files:

- `Brewfile` lists everything a fresh machine needs.
- `install.sh` bootstraps brew, oh-my-zsh, bob/nvim and Lazy restore.
- `stow.sh` backs up existing files, then stows every package; `restore.sh` reverses it.

### Shell load order (zsh)

`.zshrc` loads things in this order:

1. oh-my-zsh
2. `~/.zshrc.inject`
3. the XDG defaults
4. `personal/setup.sh` and `keymap.sh`, then `~/.config/work/setup.sh`
5. brew shellenv, starship, zoxide, fzf
6. `~/.zshrc.inject` **again**

The double source is deliberate. The first lets the inject set XDG paths, and the
second lets it override EDITOR/PAGER. Don't "fix" it.

### Machine-local, untracked hooks

`~/.zshrc.inject`, `~/.gitconfig.inject`, `~/.config/work/setup.sh` and
`~/.config/work/.gitconfig` aren't tracked. Machine- or employer-specific config belongs
there, not in the repo.

## Conventions

- **Lua** (nvim, wezterm): 2-space indent, formatted with `stylua` (`.stylua.toml`).

- **Shell**: bash, 2-space indent, formatted with `shfmt`, linted with `shellcheck`
  (from mason: `~/.local/share/nvim/mason/bin/`). New PATH scripts go in
  `personal/.config/personal/scripts/` and need to be executable, with no extension.

- **Zed JSON** is JSONC (comments and trailing commas are fine). `tasks.json` is plain JSON.

- **Neovim structure** follows the README's rules:

  - `lua/custom/config/` holds Neovim's own options, keymaps and autocmds.
  - `core/` holds the essential plugins and can have several specs per file.
  - `extra/` holds the optional plugins, one spec per file, named after the plugin.
  - `debug/` holds the dap configs for each language, required from `core/debug.lua`.

  Pass plugin settings through lazy's `opts`. Use `config` only when you need custom
  setup logic. Create autocmds in `require("custom.util").group`.

- **Theme**: Catppuccin across tools, following the system dark/light mode where possible.

- **Commits**: Conventional style with a scope, e.g. `feat(zed): ...`, `fix(neovim): ...`.
  The user's `dotsync` shell function makes `chore: quick sync` commits (add all,
  commit, push), so a dirty tree might contain unrelated work. Only commit when asked.

## Verifying changes

There's no test suite. Check each change against the target tool:

```sh
stow -n -v -t ~ -R <package>          # dry-run the symlinks a package would create
bash -n <script>; shellcheck <script> # shell scripts
stylua --check <path>                 # Lua formatting
nvim --headless +qa                   # nvim starts without errors
zsh -ic exit                          # shell starts without warnings
jq . zed/.config/zed/tasks.json       # plain JSON parses
brew bundle check --file=Brewfile --verbose  # Brewfile names resolve
```

After adding a file to a package, run `stow -t ~ -R <package>` to deploy it.

## Gotchas

- **A `.stow-local-ignore` replaces stow's default ignore list entirely.** `home/` has an
  empty one so that `.gitignore` gets stowed. `tmux/` has one with `^/plugins` so the
  leftover, gitignored `tmux/plugins/` isn't linked to `~/plugins`.
- **Homebrew installs can break other tools.** For example, installing `git-delta`
  upgraded `libgit2` and broke `bat`/`eza`. Since git → delta → `$PAGER=bat`, that
  breaks `git diff`. After any `brew install`, run
  `brew uses --installed <upgraded-dep>` and upgrade the affected formulae. After a bat
  upgrade, run `bat cache --build`.
- **Some tools on this machine don't come from brew.** nvim comes from `bob`
  (`~/.local/share/bob`), `fd` is also in `~/.local/bin` (wezterm's `sessionizer.lua`
  hardcodes that path), `tree-sitter` comes from cargo, and `uv` is in `~/.local/bin`.
  Don't run `brew bundle` without checking for duplicates.
- **Don't run `install.sh` or `stow.sh`/`restore.sh` without asking.** They change shells,
  install software and move files in `$HOME`.
- **Don't read lock files** (`Brewfile.lock.json`, `nvim/.config/nvim/lazy-lock.json`).
  They're large and generated.
- **`git-backport` and `git-sync` are work tooling** (`hotfix/CURE-0/...`, `release/*.x`
  branches) and use `gh`.
