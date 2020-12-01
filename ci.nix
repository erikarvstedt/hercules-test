builtins.mapAttrs (system: _v:
  let
    src = builtins.fetchTarball {
      # 20.03 (2020-12-01)
      url = "https://github.com/NixOS/nixpkgs/archive/df25e214c8e662d693ef89e45ce56bbf58d6c59e.tar.gz";
      sha256 = "117ir2ysw310q87mndv6czph5qjbhvggmhawcvak6x507yf0dxin";
    };
    pkgs = import src { inherit system; };
  in
    pkgs.recurseIntoAttrs rec {
      # These two attributes will appear in your job for each platform.
      hello = pkgs.hello;
      cow-hello = import ./main.nix pkgs;
      long = import ./long.nix pkgs;
      a1 = pkgs.runCommand "a1" {} ''
        mkdir $out
        echo hello ${long} > $out/a
      '';
    }
) {
  x86_64-linux = {};
  # Uncomment to test build on macOS too
  # x86_64-darwin = {};
  #
}
