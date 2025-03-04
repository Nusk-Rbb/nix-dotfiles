{ pkgs, lib, config, ... }:

with lib;
let cfg = 
    config.modules.packages;

in {
    options.modules.packages = { enable = mkEnableOption "packages"; };
    config = mkIf cfg.enable {
    	home.packages = with pkgs; [
        # Desktop Apps
        onlyoffice-bin
        obsidian

        # Develop Apps
        vscode
        discord
        gh

        # misc
        file
        bc
        cowsay
        texliveFull
        fzf
        zip
        unzip
        tree
        bc
      ];
    };
}