#!/bin/bash

rm -r ~/lrc
mkdir -p ~/lrc

find ~/Music -type f -name "*.lrc" -print0 | \
xargs -0 -n1 -P"$(nproc)" bash -c '
  file="$0"
  filename="${file##*/}"
  filename="${filename%.lrc}"
  album_dir="${file%/*}"
  artist_dir="${album_dir%/*}"
  artist="${artist_dir##*/}"

  new_filename="${filename} - (${artist}).lrc"

  if [ "$artist" == "Music" ]; then
    new_filename="${filename} - (${album_dir##*/}).lrc"
  fi

  cp "$file" ~/lrc/"$new_filename"
'
