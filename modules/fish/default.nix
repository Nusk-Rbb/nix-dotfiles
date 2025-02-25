{ pkgs, lib, config, ... }:

with lib;
let cfg = config.modules.fish;

in {
    options.modules.fish = { enable = mkEnableOption "fish"; };
    config = mkIf cfg.enable {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
        eval (gh completion -s fish| source)
        # greeting
        function fish_greeting
            printf "Hello Friend!\n\nToday is $(date "+%A %B %d")" | cowthink -f (find /nix/store/pgi56kg7qkbak3vkjm54012adx42kynz-cowsay-3.8.3/share/cowsay/cows/ -type f | shuf -n 1)
        end
        '';
        plugins = [
          {
            name = "z";
            src = pkgs.fishPlugins.z.src;
          }
        ];
        shellAliases = {
          # fish
          ec = "nvim ~/.config/fish/config.fish";
          sc = "source /home/nusk/.config/fish/config.fish";

          # home-manager
          eh = "nvim ~/.config/home-manager/home.nix";
          hs = "home-manager switch";
          hm = "home-manager";

          # network
          ip = "ip -c";

          # neovim
          nv = "nvim";

          # git
          g = "git";
          gl = "git pull --prune";
          glg = "git log --graph --decorate --oneline --abbrev-commit";
          glga = "glg --all";
          gp = "git push origin HEAD";
          gpa = "git push origin --all";
          gd = "git diff";
          gc = "git commit -s";
          gca = "git commit -sa";
          gco = "git checkout";
          gb = "git branch -v";
          ga = "git add";
          gaa = "git add -A";
          gcm = "git commit -sm";
          gcam = "git commit -sam";
          gs = "git status -sb";
          glnext = "git log --oneline (git describe --tags --abbrev=0 @^)..@";
          gw = "git switch";
          gm = "git switch (git main-branch)";
          gms = "git switch (git main-branch); and git sync";
          egms = "e; git switch (git main-branch); and git sync";
          gwc = "git switch -c";
          gpr = "git ppr";
        };
      };
        };
    }

    {
      programs.fish = {
        enable = true;
        interactiveShellInit = ''
        eval (gh completion -s fish| source)
        # greeting
        function fish_greeting
            printf "Hello Friend!\n\nToday is $(date "+%A %B %d")" | cowthink -f (find /nix/store/pgi56kg7qkbak3vkjm54012adx42kynz-cowsay-3.8.3/share/cowsay/cows/ -type f | shuf -n 1)
        end
        '';
        plugins = [
          {
            name = "z";
            src = pkgs.fishPlugins.z.src;
          }
        ];
        shellAliases = {
          # fish
          ec = "nvim ~/.config/fish/config.fish";
          sc = "source /home/nusk/.config/fish/config.fish";

          # home-manager
          eh = "nvim ~/.config/home-manager/home.nix";
          hs = "home-manager switch";
          hm = "home-manager";

          # network
          ip = "ip -c";

          # neovim
          nv = "nvim";

          # git
          g = "git";
          gl = "git pull --prune";
          glg = "git log --graph --decorate --oneline --abbrev-commit";
          glga = "glg --all";
          gp = "git push origin HEAD";
          gpa = "git push origin --all";
          gd = "git diff";
          gc = "git commit -s";
          gca = "git commit -sa";
          gco = "git checkout";
          gb = "git branch -v";
          ga = "git add";
          gaa = "git add -A";
          gcm = "git commit -sm";
          gcam = "git commit -sam";
          gs = "git status -sb";
          glnext = "git log --oneline (git describe --tags --abbrev=0 @^)..@";
          gw = "git switch";
          gm = "git switch (git main-branch)";
          gms = "git switch (git main-branch); and git sync";
          egms = "e; git switch (git main-branch); and git sync";
          gwc = "git switch -c";
          gpr = "git ppr";
        };
      };
}