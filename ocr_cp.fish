#!/usr/bin/env fish

set image_name (mktemp --suffix=.png)
if set -q WAYLAND_DISPLAY
    grimshot save area $image_name
    tesseract -c page_separator='' $image_name stdout | wl-copy
else
    import $image_name
    tesseract -c page_separator='' $image_name stdout | xclip -sel clip
end
rm $image_name
