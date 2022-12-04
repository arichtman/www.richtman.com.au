{
  description = "Zola flake";
  nixConfig.bash-prompt = "\[nix-develop\]$ ";
  inputs.utils.url = "github:numtide/flake-utils";
  outputs = { nixpkgs, utils, self, ... }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
            inherit system;
          };
          poetryEnv = pkgs.poetry2nix.mkPoetryEnv {
            projectDir = ./.;
          };
      in with pkgs; {
        devShell = mkShell {
          buildInputs = [ poetryEnv zola ];
      };
    }
  );
}
