{ config, pkgs, inputs, ... }:

{
    # Remove unecessary preinstalled packages
    environment.defaultPackages = [ ];

    programs.fish.enable = true;

    # Laptop-specific packages (the other ones are installed in `packages.nix`)
    environment.systemPackages = with pkgs; [
        git curl beep 
        gnupg htop lsof 
        lsscsi vim wget 
        wirelesstools wpa_supplicant
        zip unzip usbutils tree
    ];

    # Install fonts
    fonts = {
        fonts = with pkgs; [
          noto-fonts
          noto-fonts-cjk-sans
          noto-fonts-extra
          noto-fonts-emoji
          fira-code-nerdfont
        ];
    };

    # Set up locales (timezone and keyboard layout)
    time.timeZone = "Asia/Tokyo";
    i18n.defaultLocale = "en_US.UTF-8";
    console = {
        font = "Lat2-Terminus16";
    };

    i18n.inputMethod = {
        type = "fcitx5";
        enable = true;
        fcitx5.addons = with pkgs; [
            fcitx5-mozc
            fcitx5-gtk
        ];
    };

    # Nix settings, auto cleanup and enable flakes
    nix = {
        settings.auto-optimise-store = true;
        settings.allowed-users = [ "nusk" ];
        gc = {
            automatic = true;
            dates = "weekly";
            options = "--delete-older-than 7d";
        };
        extraOptions = ''
            experimental-features = nix-command flakes
            keep-outputs = true
            keep-derivations = true
        '';
    };

    # Set up user and enable sudo
    users.users.nusk = {
        isNormalUser = true;
        extraGroups = [ "wheel" "networkmanager" "docker" ];
        shell = pkgs.fish;
    };

    # Set up Network
    services.networkmanager.enable = true;

    # Sound
    sound = {
        enable = true;
    };

    hardware.pulseaudio.enable = true;

    services.pipewire = {
        enable = false;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };

    services.displayManager = {
        sddm.enable = true;
        sddm.wayland.enable = true;
        defaultSession = "plasma";
        plasma6.enable = true;
    };

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
        plasma-browser-integration
        dolphin-plugins
    ];
    programs.kdeconnect.enable = true;
    
    # Disable bluetooth, enable pulseaudio, enable opengl (for Wayland)
    hardware = {
        bluetooth.enable = true;
        graphics.enable = true;
        opengl = {
            enable = true;
            driSupport = true;
        };
    };

    programs.tmux = {
        enable = true;
        clock24 = true;
    };

    # Virtualization functionality
    virtualisation = {
        docker = {
        enable = true;
        autoPrune.enable = true;
        storageDriver = "overlay2";
        };
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    programs.mtr.enable = true;
    programs.gnupg.agent = {
        enable = true;
        enableSSHSupport = true;
    };

    # Enable the OpenSSH daemon.
    services.openssh.enable = true;

    # Enable allowUnfree packages
    nixpkgs.config.allowUnfree = true;

    # Do not touch
    system.stateVersion = "24.11";
}