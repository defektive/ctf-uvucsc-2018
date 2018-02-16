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
