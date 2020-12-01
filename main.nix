pkgs:

pkgs.runCommand "cow-hello" {
  buildInputs = [ pkgs.hello pkgs.cowsay ];
} ''
  # test
  hello | cowsay > $out
''
