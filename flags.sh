#!/bin/bash

# did they supply an argument (folder name)?
if [ -z "$1" ]
then
  echo "Usage: flags.sh /path/to/movies/folder" 
  exit 1;
fi

MOVIESFOLDER=$1
# or you could do like below, but you'd need to comment out the argument check above
# MOVIESFOLDER=/path/to/your/movies
FLAGSFOLDER="/Users/`whoami`/Library/Application Support/Plex/skin/Plexaeon/media/flags"

# function copy_flag($1 = search, $2 = image name, $3 = media flag name)
do_flag() {
	if [ -z "$1" ];	then echo "Example: do_flag dvd 480p resolution" return; fi;	
	find $MOVIESFOLDER -type d -iname "*$1*" -exec cp -n "$FLAGSFOLDER/$2.png" "{}/$3.png" \; 
}

#resolutions
do_flag dvd 	480p 	resolution
do_flag 1080 	1080p 	resolution
do_flag 720 	720p 	resolution

#sources
do_flag dvd 	dvd		source
do_flag Blu*Ray	bluray 	source
do_flag hd*dvd 	hddvd	source

#audio
do_flag DTS 	dts		audio
do_flag AC3		ac3 	audio

#audiochannels
do_flag 5.1		6ch		audiochannels
do_flag 7.1	 	8ch		audiochannels

exit 0;