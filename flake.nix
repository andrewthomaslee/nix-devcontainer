{
  description = "Nix package manager + Docker in Docker + Tailscale";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        git
        curl
        nano
        neovim
        rsync
        asciinema
        fastfetch
        httpie
        jq
        yq
      ];

      shellHook = ''
        echo "❄️ Welcome to your Nix-powered Devcontainer! ❄️"
        fastfetch
      '';
    };
  };
}
