{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.google-chorme;

in {
    options.modules.google-chorme = { enable = mkEnableOption "google-chrome"; };
    config = mkIf cfg.enable {
        programs.google-chorme.enable = true;
    };
}