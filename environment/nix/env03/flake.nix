{
  description = "env02 Python 3.14.4";

  inputs = {
    # https://www.nixhub.io/packages/python
    # python 3.14.4 nixpkgs/3d46470bb3030020f7e1361f33514854f5bfa86d#python314
    nixpkgs.url = "github:nixos/nixpkgs?rev=3d46470bb3030020f7e1361f33514854f5bfa86d";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      formatter.${system} = pkgs.nixfmt-tree;
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.python314
        ];
        shellHook = ''
          source .venv/bin/activate
        '';
      };
    };
}
