{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.non-secure-boot;

in {
    options.modules.non-secure-boot = { enable = mkEnableOption "non-secure-boot"; };
    config = mkIf cfg.enable {
    };
}