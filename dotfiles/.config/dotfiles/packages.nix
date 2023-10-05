{ pkgs ? import <nixpkgs> {} }:

{
  inherit (pkgs)
    act
    curl
    jq
    neovim
    parallel
    ripgrep
    rustup;
}
