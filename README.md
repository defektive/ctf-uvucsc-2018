# UVUCSC CTF
https://ctf.uvucsc.com/

## Crypto

### Decode Me
*10 points*

What could this be?
ZmxhZzpmaXJzdGZsYWcxMjM=

#### Solution
Base64

```
echo ZmxhZzpmaXJzdGZsYWcxMjM= | base64 -d
flag:firstflag123
```


### Find The Secret!
*100 points*

Can you find the secret page?

- fruitcup

#### Solution
Base64

```
echo ZmxhZzpmaXJzdGZsYWcxMjM= | base64 -d
flag:firstflag123
```


### Caesar
*20 points*

While looking through a document you find the following string, can you decrypt it?
espdpncpealddascldptdfvaaychcjplgrehtnqxycvmykpblhr

- fruitcup

#### Solution

I used https://decryptonomicon.github.io/#!/shift, but http://www.rot13.com/ is probably easier.

rot15

```
thesecretpassphraseisukppnrwryeavgtwicfmnrkbnzeqawg
```


### @CypherMonkey
*100 points*

Did you know that every Sunday [@AaronToponce](https://twitter.com/AaronToponce) posts Viginere or Cryptograms on his [@CipherMonkey](https://twitter.com/CipherMonkey) twitter account?

This challenges is to solve this week's HARD challenge.
<blockquote class="twitter-tweet" data-conversation="none" data-lang="en"><p lang="en" dir="ltr">Difficulty: 🦍<br>Type: Cryptogram<a href="https://t.co/zWkSu0e1h5">https://t.co/zWkSu0e1h5</a> <a href="https://t.co/RWj4qBJY7O">pic.twitter.com/RWj4qBJY7O</a></p>&mdash; Cipher Monkey (@CipherMonkey) <a href="https://twitter.com/CipherMonkey/status/957748981546721281?ref_src=twsrc%5Etfw">January 28, 2018</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

Submit the solved version as you would read it.
Example submission:
`this is a really cool challenge and i like it`

Make sure you tweet [@CipherMonkey](https://twitter.com/CipherMonkey) and let him know you solved it! They love seeing people play with their challenges.

\- BashNinja - [@miketweaver](https://twitter.com/miketweaver)

#### Solution

I used https://www.guballa.de/substitution-solver


### Vigenère
*100 points*

Ciphertext:
`LKAMALZFY MHIKUXZ ZRPVNSGSUX AZJ'T CACX DLOTZFY VRFLS, WSJF BFU. - HRF KHLF`


Enter the cipher key in this format:
`librarian`

\- BashNinja - [@miketweaver](https://twitter.com/miketweaver)

#### Solution

https://www.dcode.fr/vigenere-cipher common dictionary

Noticed the star key made the plain text end in solo

Tried `starwars` as the key


### wargames
*200 points*

Use a Flag from another challange to decrypt the zip.

- fruitcup

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


### Sum Fun with MD5
*50 points*

I found these lines in a text file. What do they mean?

8fc42c6ddf9966db3b09e84365034357
327a6c4304ad5938eaf0efb6cc3e53dc
a2a551a6458a8de22446cc76d639a9e9
68b2a124d6d55cb7f0c1b975d6f0358a

#### Solution

just googled the md5s.

- 8fc42c6ddf9966db3b09e84365034357 the
- 327a6c4304ad5938eaf0efb6cc3e53dc flag
- a2a551a6458a8de22446cc76d639a9e9 is
- 68b2a124d6d55cb7f0c1b975d6f0358a Rivest

## Forensics

### EULAs are Fun
*100 points*



#### Solution

Reading is fun

```
7. RENTAL. YOU MAY NOT LOAN, RENT, OR LEASE THE SOFTWARE. 7A. YOU MAY SUBMIT THIS TO GET TEN POINTS: ILOVEREADINGEULAS.
```


### Save my Files!
*350 points*

I had a picture saved on a flashdrive, but I ignored the "Safely Remove Hardware" warning and unplugged it. Now I cant see my files!

#### Solution

Used TestDisk, it mentioned finding an extfs. so I ran `e2fsk` on it.

```
$ e2fsck copy.img
e2fsck 1.43.9 (8-Feb-2018)
ext2fs_open2: The ext2 superblock is corrupt
e2fsck: Superblock invalid, trying backup blocks...
copy.img was not cleanly unmounted, check forced.
Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information
Free blocks count wrong for group #0 (6789, counted=488).
Fix<y>? yes
Free blocks count wrong for group #1 (2006, counted=228).
Fix<y>? yes
Free blocks count wrong (8795, counted=716).
Fix<y>? yes
Free inodes count wrong for group #0 (1269, counted=1262).
Fix<y>? yes
Free inodes count wrong (2549, counted=2542).
Fix<y>? yes

copy.img: ***** FILE SYSTEM WAS MODIFIED *****
copy.img: 18/2560 files (11.1% non-contiguous), 9524/10240 blocks
$ sudo mount copy.img mnt
[sudo] password for defektive:
$ ls mnt
AE5  file  fil.enc  lost+found  ran2  ran3  ran4  rand
```

Googled the contents of AE5

http://capturetheswag.blogspot.com/2015/03/opentoall-ctf2015-gone-forensics.html

ext_sooper_blocks_are_c00l


### got pcaps?
*200 points*

Find the flag hidden in the provided .pcap file.
You can use Wireshark to view the packet.

Key is all lowercase.

- fruitcup

#### Solution

- Used wireshark, noticed http requests to a `/secret/` path.
- Exported bytes for each request
- added png extension
- imported pngs into google slides, so could assemble the puzzle drag drop style


### Packets 101
*50 points*

Do you know your way around Wireshark?

by Cronocide

#### Solution

used the following filters
- tcp.payload contains "flag"
- tcp.payload contains "jpg"

found secret.jpg, exported the jpg, found the flag


### Invisibility Cloak
*200 points*

Try and Catch me....

#### Solution

Emojis!!

checked out Cloakify

needed each emoji on one line
```
sed -e "s/.\{1\}/&\n/g" < ../invisibilitycloak > ../sedify
```

```
python2 decloakify.py ../sedify ciphers/emoji | xxd | less
```

Noticed JFIF header

```
python2 decloakify.py ../sedify ciphers/emoji > ../flag.jpg
```

uRaw1z4Rd

You're a wizard Harry!


### HTMLicious
*50 points*

CTF Challenges can be like Ogres...

#### Solution

just kept rendering the html until it didnt have any html to render

```
flag:3nc4psul4ti0n
```

## Reversing

### Not Enough Love
*200 points*

Everyone needs to show love to their favorite friends, right?

Well this <i>exe</i> wants you to do the same. Maybe try running it?

Note:
This exe is guaranteed to NOT be malicious. Nonetheless, there is still a flag in it for you to find.

\- BashNinja - [@miketweaver](https://twitter.com/miketweaver)

#### Solution

Used ilspymono

```
ilspymono ./ not-enough-love.exe ./output
```

```
qba'g hfr fgevatf.... be qb. synt{v-ybir-orvat-cenvfrq}
```

rot13

```
don't use strings.... or do. flag{i-love-being-praised}
```


### Magic Word
*50 points*

Here's a Binary for you to run.

Hope you know the magic word!

Note:
This binary is guaranteed to NOT be malicious. Nonetheless, there is still a flag in it for you to find.

\- BashNinja - [@miketweaver](https://twitter.com/miketweaver)

#### Solution

```
strings magic-word.o | less
```

searched for flag


### Shall we play a game?
*300 points*

It looks like we've been given access to a binary from the [WOPR](https://en.wikipedia.org/wiki/WarGames).

You should take a look and see if Professor Falken left any extra surprises.

Professor Falken compiled this on all your OSes for you. Isn't he so kind?

Note:
These binaries is guaranteed to NOT be malicious. Nonetheless, there is still a flag in it for you to find.

\- BashNinja - [@miketweaver](https://twitter.com/miketweaver)

#### Solution


- used https://onlinedisassembler.com/static/home/index.html to see all the methods
- used edb
- set RIP to call answer function


### What is this!?
*100 points*

We found this file on our network.
What is this??
<iframe src="https://giphy.com/embed/l4JyOwGH26UNQebBK" width="460" height="230" frameBorder="0" class="giphy-embed" allowFullScreen></iframe>


\- BashNinja - [@miketweaver](https://twitter.com/miketweaver)

#### Solution


Its png!

had to fix the png header, had to add bytes, not replace them. used wxhexeditor


### Audio Medic!
*300 points*

We've stolen Sombra's audio password, but it's scrambled. Will solving this be the Play of the Game?

(All numbers should be submitted in numeric form.)

#### Solution

Used audacity. see audiomedic-final.aup

51132404332412


### ASCIIw
*50 points*

I don't know what to do with this.

#### Solution

```
II_____.__IIIIIIIIIIIIIIIIIIIIIIIII_____I.________________II________II____II_________________II____II________________II________II
_/I____\II|I_____IIIII____III/\III/II|II||III____/\_____II\I\_____II\/_III|/II_____/\______II\/_III|/II_____/\_____II\I\_____II\I
\III__\|II|I\__II\III/I___\II\/II/III|II||____II\III_(__II<II/II____/I|III/III__II\IIIII/IIII/I|III/III__II\III_(__II<II/II____/I
I|II|II|II|__/I__I\_/I/_/II>I/\I/IIII^III/IIIIIII\I/IIIIIII\/IIIIIII\I|III\II|__\II\III/IIII/II|III\II|__\II\I/IIIIIII\/IIIIIII\I
I|__|II|____(____II/\___II/II\/I\____III/______II//______II/\_______I\|___|\_____II/II/____/III|___|\_____II//______II/\_______I\
IIIIIIIIIIIIIIIII\//_____/IIIIIIIIIII|__|IIIIII\/IIIIIIII\/IIIIIIIII\/IIIIIIIIIII\/IIIIIIIIIIIIIIIIIIIIIII\/IIIIIIII\/IIIIIIIII\/
```
replace I with a space
```
_____.__                         _____ .________________  ________  ____  _________________  ____  ________________  ________
_/ ____\  | _____     ____   /\   /  |  ||   ____/\_____  \ \_____  \/_   |/  _____/\______  \/_   |/  _____/\_____  \ \_____  \
\   __\|  | \__  \   / ___\  \/  /   |  ||____  \   _(__  <  /  ____/ |   /   __  \     /    / |   /   __  \   _(__  <  /  ____/
|  |  |  |__/ __ \_/ /_/  > /\ /    ^   /       \ /       \/       \ |   \  |__\  \   /    /  |   \  |__\  \ /       \/       \
|__|  |____(____  /\___  /  \/ \____   /______  //______  /\_______ \|___|\_____  /  /____/   |___|\_____  //______  /\_______ \
               \//_____/           |__|      \/        \/         \/           \/                       \/        \/         \/
```
45321671632


### Coffee Break
*100 points*

I was trying to copy this file over on the command line and I think I messed up the arguments. Now the file won't open. Can you help?

#### Solution
Using `xxd` i could see all the bytes were swapped around

```
dd if=broken.png of=unbroken.png conv=swab
```
