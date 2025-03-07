{ config, lib, ... }:
{
  home-manager.sharedModules = [
    {
      programs.starship = {
        enable = true;
        enableBashIntegration = true;
        enableZshIntegration = true;

        settings = {
          format = lib.concatStrings [
            "$username"
            "$hostname"
            "$directory"
            "$git_branch"
            "$git_state"
            "$git_status"
            "$nix_shell"
            "$cmd_duration"
            "$line_break"
            "$character"
          ];

          directory = {
            truncation_length = 1;
            style = "bold";
          };

          nix_shell = {
            symbol = "";
            style = "bold blue";
          };

          git_branch = {
            symbol = "";
            style = "bold red";
          };

          git_state.style = "bold red";
          git_status.style = "bold red";

          character = {
            success_symbol = "[❯](green)";
            error_symbol = "[❯](red)";
            vimcmd_symbol = "[❮](green)";
          };
        };
      };
    }
  ];
}
