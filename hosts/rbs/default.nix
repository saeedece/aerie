# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./user.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  # networking.networkmanager.enable = true;
  networking = {
    networkmanager.enable = true;
    nftables.enable = true;
    firewall.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/New_York";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Enable openrazer
  hardware.openrazer.enable = true;

  # NVIDIA AHHHHHHHHHHHHHHHHH
  hardware.nvidia = {
    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:2:0:0";
    };
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  nix.settings =
    let
      nixConf = import ../../nix/conf.nix;
    in
    {
      "substituters" = nixConf.binaryCaches;
      "trusted-public-keys" = nixConf.binaryCachePublicKeys;
      "experimental-features" = [
        "nix-command"
        "flakes"
      ];
    };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    curl
    podman-compose
    openrazer-daemon
  ];

  environment.gnome.excludePackages = with pkgs; [
    gnome-photos
    gnome-tour
    gnome-frog
    enter-tex
    gnome-console
    cheese
    gnome-music
    gnome-terminal
    epiphany
    geary
    gnome-characters
    gnome-calendar
    gnome-contacts
    gnome-weather
    totem
    tali
    iagno
    hitori
    atomix
    rygel
  ];

  # zsh completion for system packages
  environment.pathsToLink = [ "/share/zsh" ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs = {
    command-not-found.enable = false;
    xfconf.enable = true;
    zsh.enable = true;
    git = {
      enable = true;
      prompt.enable = true;
    };
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
      ];
    };
  };

  # List services that you want to enable:
  services = {
    xserver = {
      xkb = {
        layout = "us";
        variant = "";
      };
      enable = true;
      videoDrivers = [ "nvidia" ];
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
