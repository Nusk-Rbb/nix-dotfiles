{ pkgs, lib, config, ... }:

with lib;
let
    cfg = config.modules.secure-boot;
    sources = import ./nix/sources.nix;
    lanzaboote = import sources.lanzaboote;
    unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {
    options.modules.secure-boot = { enable = mkEnableOption "secure-boot"; };
    config = mkIf cfg.enable {
        # Use the systemd-boot EFI boot loader.
        boot.loader.grub = {
            enable = true;
            device = "nodev";
            efiSupport = true;
            useOSProber = true;
        };    
        boot.loader.efi.canTouchEfiVariables = true;
    };
}