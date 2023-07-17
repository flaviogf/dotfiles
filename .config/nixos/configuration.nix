{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };

  environment = with pkgs; {
    shells = [
      fish
    ];

    systemPackages = [
      alacritty
      docker
      docker-compose
      dmenu
      exa
      fd
      fish
      git
      go
      google-chrome
      google-cloud-sdk
      haskellPackages.xmobar
      htop
      jdk11
      jdt-language-server
      lazydocker
      lazygit
      lua-language-server
      lxappearance
      maven
      neovim
      nitrogen
      rubyPackages.solargraph
      picom
      pavucontrol
      ripgrep
      slack
      starship
      tmux
      tmuxinator
      xclip
    ];
  };

  hardware.bluetooth.enable = true;

  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;

      networks = {
      };
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  programs = {
    fish = {
      enable = true;
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  security.rtkit.enable = true;

  sound.enable = true;

  system.copySystemConfiguration = true;

  services = {
    blueman = {
      enable = true;
    };
    openssh = {
      enable = true;
    };
    picom = {
      enable = true;

      settings = {
        fade-out-step = 0.03;
        fade-in-step = 0.03;
        fading = true;
      };
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
    xserver = {
      enable = true;
      layout = "us";

      displayManager = {
        autoLogin = {
          enable = true;
          user = "flaviogf";
        };

        defaultSession = "none+xmonad";
      };

      videoDrivers = [ "nvidia" ];

      xkbVariant = "intl";
      xkbOptions = "ctrl:nocaps";

      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
        };
      };
    };
  };

  time.timeZone = "America/Sao_Paulo";

  users = {
    groups = {
      flaviogf = {};
    };

    users = {
      flaviogf = {
        extraGroups = [ "docker" "wheel" ];
        group = "flaviogf";
        home = "/home/flaviogf";
        isNormalUser = true;
        shell = pkgs.fish;
      };
    };
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "23.05";
}
