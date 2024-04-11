# This can non-declaratively install packages on your system.
# You can run this using `nix-env -if filename.nix`
{ unstable ? import <unstable> {} }:
{
  # Using a set to make life easy
  # This is the same as [ pkgs.foo ... ]
  inherit (unstable)
    bun
    go
    wezterm
    zoxide
    ;
}
