{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "24.11";
    imports = [
        # boot
        ./secure-boot
        ./non-secure-boot

        # gui
        ./google-chrome

        # cli
        ./nvim
        ./fish
        ./git
        ./gh

        # system
	    ./packages
    ];
}