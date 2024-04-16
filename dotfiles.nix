# This can non-declaratively install packages on your system.
# You can run this using `nix-env -if filename.nix`
{
  pkgs ? import <nixpkgs> {},
  unstable ? import <unstable> {}
}: {
  inherit (pkgs)
    bat
    curl
    eza
    fd
    fzf
    git
    gnumake
    jq
    neovim
    python3
    ripgrep
    stow
    tmux
    zsh
    ;

  inherit (unstable)
    bun
    go
    starship
    wezterm
    zoxide
    ;
}
