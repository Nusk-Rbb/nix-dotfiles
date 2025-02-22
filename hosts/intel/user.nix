{ config, lib, inputs, ...}:

{
    imports = [ ../../modules/default.nix ];
    config.modules = {
        # gui
        google-chrome.enable = true;

        # cli
        neovim.enable = true;
        fish.enable = true;
        git.enable = true;
        fastfetch.enable = true;

        # system
        packages.enable = true;
    };
}