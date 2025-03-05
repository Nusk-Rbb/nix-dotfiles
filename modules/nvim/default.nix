{ pkgs, lib, config, ... }:
with lib;

let
  cfg = config.modules.nvim;
  neovimDotfiles = fetchgit {
    url = "https://github.com/Nusk-Rbb/nvim-dotfiles.git";
    rev = "v1.0.0"; # 特定のバージョンを指定
    sha256 = "1mrgjp5lw20f42bhbqz6bkagidzflgq5cyji6bgqqv65px77m6aa"; # SHA256ハッシュを指定
  };
in {
  options.modules.nvim = { enable = mkEnableOption "nvim"; };

  config = mkIf cfg.enable {
    programs.neovim = {
      enable = true;
      plugins = with pkgs; [
        # Neovimのプラグインをリストアップ
        vim-plug
        # その他のプラグイン
      ];
      extraConfig = ''
       -- GitHubからダウンロードしたdotfilesを適用
        require('lazy').setup({
          lockfile = "${neovimDotfiles}/lazy-lock.json",
          defaultConfigs = {
            lazyvim = "${neovimDotfiles}/lazyvim.json",
          },
        })
        source ${neovimDotfiles}/init.lua 
      '';
    };
  };
}