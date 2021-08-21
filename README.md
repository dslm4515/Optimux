# Optimux
## Optimized Musl Linux

This is a deriviative of [MLFS](https://github.com/dslm4515/Musl-LFS) (Musl Linux From Scratch) with a focus on optimization and speed. 

Methods and patches will be from Alpine Linux, Void Linux, and Clear Linux. Work from Alpine and Void are primarily for Musl Libc support and optimizations from Clear Linux.

### Specification

<ul>
<li>Compiler: GNU's GCC</li>
<li>Binary Utilities: GNU Binutils</li>
<li>System Library C: Musl</li>
<li>INIT system: skarnet's S6 & S6-rc</li>
<li>TLS Implementaion: LibreSSL</li>
<li>Device manager: Udev </li>
<li>Gettext: gettext-tiny </li>
<li>Zlib: zlib-ng </li>
</ul>

### Method

Build cross-tools & tools just like in MLFS, but enable LTO & graphite (ISL) in tools' GCC & binutils.

Most packages [in chroot] will be built with these flags:

```
CFLAGS="-flto -march=native -mtune=native -O3 -pipe -fno-semantic-interposition "
CFLAGS+="-falign-functions=32 -flimit-function-alignment -malign-data=cacheline "
CXXFLAGS=$CFLAGS
LDFLAGS="-flto -Wl,-O2 -Wl,--as-needed
```

### Goals

<ul>
<li> [x] Build GCC with Graphite </li>
<li> [x] Build GCC with LTO(full) support </li>
<li> [x] Build rootfs with LTO and optimizing flags </li>
<li> [X] Clean up patches for GCC-11.2 </li>
<li> [ ] Add autotools (automake, autoconf) to tools </li>
<li> [ ] Add script to check build requirements </li>
<li> [ ] Update initramfs to use binaries from s6-portable-utils </li>
<lI> [ ] Port to aarch64 (64-bit ARM) </li>
<lI> [ ] Port to i686 (32-bit x86) </li>
</ul>

### Build Requirements
<ul>
 <li>bash 3.2 (/bin/sh should be a symbolic or hard link to bash) </li>
 <li>binutils 2.25 </li>
 <li>bison 2.7 (/usr/bin/yacc should be a link to bison or small script that executes bison) </li>
 <li>bzip2 1.0.4 </li>
 <li>coreutils 6.9 </li>
 <li>diffutils 2.8.1 </li>
 <li>findutils 4.2.31 </li>
 <li>gawk 4.0.1 (/usr/bin/awk should be a link to gawk) </li>
 <li>GCC 6.2, including the C++ compiler, g++ </li>
 <li>Glibc 2.11 / Musl Libc 1.20 </li>
 <li>Grep 2.5.1a </li>
 <li>gzip 1.3.12 </li>
 <li>linux kernel 3.2 (not sure if it matters, as most distros are running 4.x/5.x kernels)</li>
 <li>m4 1.4.10</li>
 <li>make 4.0 </li>
 <li>patch 2.5.4 </li>
 <li>Python 3.4 </li>
 <li>sed 4.1.5 </li>
 <li>tar 1.22 </li>
 <li>texinfo 4.7 </li>
 <li>xz 5.0.0 </li>
</ul>

### Issues

~~Built system will not allow any logins. This was caused by a broken Shadow-4.9 build. Using shadow-4.8 build from MLFS for now.~~
