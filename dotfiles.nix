# This can non-declaratively install packages on your system.
# You can run this using `nix-env -if filename.nix`
{
  stable ? import <stable> {},
  unstable ? import <unstable> {}
}: {
  inherit (stable)
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
    tmux
    zsh
    ;

  inherit (unstable)
    bun
    go
    starship
    stow
    stylua
    wezterm
    zoxide
    ;
}
