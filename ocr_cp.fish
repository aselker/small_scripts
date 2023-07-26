#!/usr/bin/env fish

set image_name (mktemp --suffix=.png)
# import $image_name
# tesseract -c page_separator='' $image_name stdout | xclip -sel clip
grimshot save area $image_name
tesseract -c page_separator='' $image_name stdout | wl-copy
rm $image_name
