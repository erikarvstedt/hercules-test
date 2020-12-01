pkgs:

pkgs.runCommand "long" {
  buildInputs = [ pkgs.hello pkgs.cowsay ];
} ''
  sleep 20
  mkdir $out
  </dev/urandom head -c $((1024*1024*50)) > $out/data
''
