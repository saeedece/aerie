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
        symbol = "";
        style = "bold";
      };
      directory = {
        truncation_length = 1;
        style = "bold";
      };
    };
  };
}
