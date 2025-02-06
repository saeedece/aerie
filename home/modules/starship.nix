{ lib, ... }:
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
        "$nix_shell"
        "$character"
      ];
      nix_shell = {
        format = "via [$symbol$state]($style) ";
        symbol = "";
        style = "bold";
      };
      directory = {
        truncation_length = 1;
        style = "bold";
      };
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
    };
  };
}
