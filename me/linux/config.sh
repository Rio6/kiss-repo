#!/bin/sh -e
CACHED_SOURCE=~/.cache/kiss/sources/linux/linux.git

if ! [ -d "$CACHED_SOURCE" ]; then
   echo No cached source >&2
   exit 1
fi

cp files/config "$CACHED_SOURCE"/.config
make -C "$CACHED_SOURCE" ${@:-nconfig}
mv "$CACHED_SOURCE"/.config files/config
kiss c
