{
  description = "Dev shell";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.aarch64-darwin;
      pkgs-x86 = nixpkgs.legacyPackages.x86_64-darwin;
    in
    {

      devShells.aarch64-darwin.default = pkgs.mkShell {
        packages = with pkgs; [
          nodejs
          nil
        ];
      };

    };
}
