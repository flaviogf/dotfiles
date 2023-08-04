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
    etc = {
      "ppp/options" = {
        text = "ipcp-accept-remote";
      };
    };

    shells = [
      fish
    ];

    systemPackages = [
      alacritty
      dmenu
      docker-compose
      exa
      fd
      fish
      flameshot
      git
      gnumake
      go
      google-chrome
      (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
      haskellPackages.xmobar
      htop
      jdk11
      jdt-language-server
      jq
      kaf
      kubectl
      lazydocker
      lazygit
      lua-language-server
      lxappearance
      maven
      neovim
      networkmanager-fortisslvpn
      nitrogen
      openconnect
      openconnect-sso
      openfortivpn
      pavucontrol
      picom
      ripgrep
      (ruby.withPackages (ps: with ps; [ solargraph ]))
      slack
      starship
      tmux
      tmuxinator
      unzip
      usbutils
      xboxdrv
      xclip
      xorg.xev
      (steam.override { extraPkgs = pkgs: [ pango harfbuzz libthai ]; }).run
      steamPackages.steamcmd
    ];
  };

  hardware.bluetooth.enable = true;

  networking = {
    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-fortisslvpn
      ];
    };
  };

  nix.nixPath = [
    "nixpkgs=https://github.com/NixOS/nixpkgs/archive/b6bbc53029a31f788ffed9ea2d459f0bb0f0fbfc.tar.gz"
    "nixos-config=/etc/nixos/configuration.nix"
    "/nix/var/nix/profiles/per-user/root/channels"
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import "${builtins.fetchTarball https://github.com/vlaci/openconnect-sso/archive/master.tar.gz}/overlay.nix")
  ];

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
        extraGroups = [ "docker" "networkmanager" "wheel" ];
        group = "flaviogf";
        home = "/home/flaviogf";
        isNormalUser = true;
        shell = pkgs.fish;
      };
    };
  };

  virtualisation = {
    docker = {
      enable = true;
    };
  };

  system.stateVersion = "23.05";
}
