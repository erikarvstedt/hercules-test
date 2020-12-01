pkgs:

pkgs.runCommand "cow-hello" {
  buildInputs = [ pkgs.hello pkgs.cowsay ];
} ''
  hello | cowsay > $out
'';
