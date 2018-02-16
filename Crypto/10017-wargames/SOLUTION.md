#### Solution

Used ukppnrwryeavgtwicfmnrkbnzeqawg from challenge 3

noticed a lot of garbage. so I moved all files into a directory named using the file's sha1sum.

I think this is what i used.
```
for f in *.?in; do sum=`sha1sum $f|cut -d' ' -f 1`; mkdir -p shas/$sum; cp $f shas/$sum/; done;
```

now that i had unique files. I copied out one file from each directory.

```
for f in *; do cp "$f/`ls $f | head -n 1`" ./; done
```

then started looking for anomolies in the text. noticed file sizes were all dupes except `FileGen 106497027.bin`

```
Geheimnis: DAVG EHFF JWIP XASH YI
Umkehrwalze: B
Grundstellung: AAA
Ringstellung: UVU
```
translated
```
Secret: DAVG EHFF JWIP XASH YI
reversing roll: B
basic position: AAA
Ringstellung: UVU
```

After some googling it was apparent this was an enigma cipher.

used http://enigma.louisedade.co.uk/enigma.html to decrypt
