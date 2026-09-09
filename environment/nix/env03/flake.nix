{
  description = "env02 Python 3.14.4";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # https://www.nixhub.io/packages/python
    # python 3.14.4 nixpkgs/3d46470bb3030020f7e1361f33514854f5bfa86d#python314
    pypkgs.url = "github:nixos/nixpkgs?rev=3d46470bb3030020f7e1361f33514854f5bfa86d";
  };

  outputs =
    {
      self,
      nixpkgs,
      pypkgs,
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
      python3144 = pypkgs.legacyPackages.${system}.python314;
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          python3144
        ];
        shellHook = ''
          if [ ! -d ".venv" ]; then
              python -m venv .venv
          fi

          source .venv/bin/activate
        '';
      };
    };
}
