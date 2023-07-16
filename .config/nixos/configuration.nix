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
      zsh
    ];

    systemPackages = [
      alacritty
      alsa-utils
      asdf-vm
      dmenu
      exa
      fish
      gcc
      git
      google-chrome
      lazygit
      neovim
      nitrogen
      picom
      pavucontrol
      starship
      tmux
    ];
  };


  hardware.bluetooth.enable = true;

  networking = {
    wireless.enable = true;

    wireless.networks = {
      "Fernandes 5G" = {
        psk = "Bicuco2020!";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

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
    extraGroups = [ "wheel" ];
    home = "/home/flaviogf";
    isNormalUser = true;
    shell = pkgs.fish;
  };

  system.stateVersion = "23.05";
}
