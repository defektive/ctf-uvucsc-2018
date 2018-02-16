#! /bin/bash

folders=( Crypto Forensics Reversing )



echo "# UVUCSC CTF" > README.md
echo https://ctf.uvucsc.com/ >> README.md
echo  >> README.md

for f in "${folders[@]}"; do
  echo "## $f" >> README.md
  for chal in "$f/"*; do
    echo  >> README.md
    cat "$chal/README.md" >> README.md
    cat "$chal/SOLUTION.md" >> README.md
    echo  >> README.md
  done
done
