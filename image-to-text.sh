#!/bin/bash 
# Dependencies: tesseract-ocr imagemagick scrot xsel

tesseract_lang=eng
# quick language menu, add more if you need other languages.

SCR_IMG=`mktemp`
trap "rm $SCR_IMG*" EXIT

# scrot -s $SCR_IMG.png -q 100
gnome-screenshot -a -f $SCR_IMG.png
# increase image quality with option -q from default 75 to 100

mogrify -modulate 100,0 -resize 400% $SCR_IMG.png
#should increase detection rate

tesseract $SCR_IMG.png $SCR_IMG &> /dev/null
cat $SCR_IMG.txt | xsel -bi

exit
