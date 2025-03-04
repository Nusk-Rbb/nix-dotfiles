{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.secure-boot;
    sources = import ./nix/sources.nix;
    lanzaboote = import sources.lanzaboote;
in {
    options.modules.secure-boot = { enable = mkEnableOption "secure-boot"; };
    imports =
        [ # Include the results of the hardware scan.
            lanzaboote.nixosModules.lanzaboote
        ];
    config = mkIf cfg.enable {

        # Lanzaboote currently replaces the systemd-boot module.
        # This setting is usually set to true in configuration.nix
        # generated at installation time. So we force it to false
        # for now.
        boot.loader.systemd-boot.enable = lib.mkForce false;
        #boot.loader.systemd-boot.enable = true;
        boot.loader.efi = {
            canTouchEfiVariables = true;
            efiSysMountPoint = "/boot";
        };

        boot.lanzaboote = {
            enable = true;
            pkiBundle = "/var/lib/sbctl";
        };
    };
}