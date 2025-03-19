{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;

        settings = {
          aws.symbol = "aws ";
          c.symbol = "C ";
          character = {
            success_symbol = "[❯](green)";
            error_symbol = "[❯](red)";
            vimcmd_symbol = "[❮](green)";
          };
          deno.symbol = "deno ";
          directory = {
            truncation_length = 1;
            style = "bold";
          };
          git_branch = {
            symbol = "";
            style = "bold red";
          };
          git_state.style = "bold red";
          git_status.style = "bold red";
          nix_shell = {
            symbol = "nix ";
            style = "bold blue";
          };
          package.symbol = "pkg ";
          python.symbol = "py ";
          rust.symbol = "rs ";
          zig.symbol = "zig ";
        };
      };
    }
  ];
}
