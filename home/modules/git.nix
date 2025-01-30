{ ... }:
{
  programs.git = {
    enable = true;
    userName = "saeed";
    userEmail = "194545651+saeedece@users.noreply.github.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
