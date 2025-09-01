{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-${builtins.readFile ./VSN}";
  outputs =
    { self, nixpkgs }:
    {
      nixosConfigurations."nixos" = nixpkgs.lib.nixosSystem {
        modules = [
          huskyos/configuration.nix
          { nix.settings.experimental-features = [ "nix-command flakes" ]; }
        ];
      };
    };
}
