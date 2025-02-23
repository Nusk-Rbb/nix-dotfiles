{ inputs, pkgs, config, ... }:

{
    home.stateVersion = "24.11";
    imports = [
        # gui
        ./google-chrome

        # cli
        ./nvim
        ./fish
        ./git
        ./direnv
        ./gh

        # system
        ./kde
	    ./packages
    ];
}