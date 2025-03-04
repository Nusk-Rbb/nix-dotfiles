{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.non-secure-boot;

in {
    options.modules.non-secure-boot = { enable = mkEnableOption "non-secure-boot"; };
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