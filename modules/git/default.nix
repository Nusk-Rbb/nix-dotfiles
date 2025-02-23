{ pkgs, lib, config, ... }:

with lib;
let 
  cfg = config.modules.git;
  commitTemplateUrl = "https://gist.github.com/Nusk-Rbb/71c353b04c7d16220db2392087c478b1"; 
  # Commit template の取得 (gist またはローカルファイル)
  commitTemplate =
    if builtins.hasAttr "commitTemplateUrl" self then
      pkgs.fetchurl {
        url = commitTemplateUrl;
        sha256 = "1ip4w0gs2xii6vvpsylfw6ns4fdg5ki68cwqqzv0lh65cnr9kw06"; # Gist の SHA256 ハッシュ (gist の内容が変わるたびに更新が必要)
      }
    else if builtins.hasAttr "commitTemplatePath" self then
      builtins.readFile commitTemplatePath
    else
      ""; # デフォルトのテンプレート (空)

in {
    options.modules.git = { enable = mkEnableOption "git"; };
    config = mkIf cfg.enable {
        programs.git = {
            enable = true;
            userName = "Nusk-Rbb";
            userEmail = "nuskrbb1741dn@gmail.com";
            extraConfig = {
                init = { defaultBranch = "main"; };
                core = {
                    excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore";
                };
                commit = {
                    template = commitTemplate; # ここでテンプレートを設定
                };
            };
        };
    };
}