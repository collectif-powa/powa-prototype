#!/bin/sh

set -u
set -e
set -x

for file in *.svg ; do
	echo "$file"

	for size in 4096 2048 1024 512 256 128 100 64 32 16 ; do
		smallpng="$(echo "$file" |sed "s/.svg$/.${size}p.png/")"
		echo "$smallpng"

		inkscape \
			--without-gui \
			"--file=$file" \
			"--export-width=${size}" \
			"--export-png=${smallpng}"
	done
done
