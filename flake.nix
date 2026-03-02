{
  description = "NixOS Devcontainer with DinD";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosConfigurations.devcontainer = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        # IMPORTANT: This module adds the `config.system.build.tarball` attribute
        "${nixpkgs}/nixos/modules/virtualisation/docker-image.nix"

        ({pkgs, ...}: {
          boot.isContainer = true;

          nix.settings.experimental-features = ["nix-command" "flakes"];

          # Enable Docker-in-Docker
          virtualisation.docker.enable = true;

          environment.systemPackages = with pkgs; [git nano curl docker];

          users.users.vscode = {
            isNormalUser = true;
            extraGroups = ["wheel" "docker"];
            password = "";
          };
          security.sudo.wheelNeedsPassword = false;
        })
      ];
    };
  };
}
