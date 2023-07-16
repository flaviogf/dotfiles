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
      haskellPackages.xmobar
      jdk11
      jdt-language-server
      lazydocker
      lazygit
      lua-language-server
      lxappearance
      neovim
      nitrogen
      rubyPackages.solargraph
      picom
      pavucontrol
      ripgrep
      slack
      starship
      tmux
      xclip
    ];
  };

  hardware.bluetooth.enable = true;

  networking = {
    wireless = {
      enable = true;
      userControlled.enable = true;
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.config.permittedInsecurePackages = [
    "openssl-1.1.1u"
  ];

  programs.fish.enable = true;

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
        shadow-offset-x = -3;
        shadow-offset-y = -3;
        shadow-opacity = 0.6;
        shadow-radius = 8;
        shadow = true;

        fade-out-step = 0.03;
        fade-in-step = 0.03;
        fading = true;

        inactive-opacity-override = false;
        inactive-opacity = 1.0;
        active-opacity = 1.0;
        frame-opacity = 1.0;

        dropdown_menu = {
          opacity = 1.0;
        };

        popup_menu = {
          opacity = 1.0;
        };

        opacity-rule = [];
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

      windowManager = {
        xmonad = {
          enable = true;
          enableContribAndExtras = true;
	};
      };

      xkbVariant = "intl";
      xkbOptions = "ctrl:nocaps";
    };
  };

  time.timeZone = "America/Sao_Paulo";

  users.users.flaviogf = {
    extraGroups = [ "docker" "wheel" ];
    home = "/home/flaviogf";
    isNormalUser = true;
    shell = pkgs.fish;
  };

  virtualisation.docker.enable = true;

  system.stateVersion = "23.05";
}
