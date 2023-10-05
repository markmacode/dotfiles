{ pkgs ? import <nixpkgs> {} }:

{
  inherit (pkgs)
    act
    curl
    git
    jq
    neovim
    parallel
    ripgrep
    rustup
    stow;
}
