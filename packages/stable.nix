# This can non-declaratively install packages on your system.
# You can run this using `nix-env -if filename.nix`
{ pkgs ? import <nixpkgs> {} }:
{
  # Using a set to make life easy
  # This is the same as [ pkgs.foo ... ]
  inherit (pkgs)
    bat
    eza
    fd
    fzf
    git
    gnumake
    jq
    neovim
    oh-my-zsh
    python3
    ripgrep
    stow
    zsh
    ;
}
