# frame-tag.el

frame-tag-mode is an Emacs minor mode that allows you to switch to frames using the key bindings M-1 through M-9.

## Usage

Frames are tagged in order. The top leftmost frame starts from 0. The next frame gets 1 and so on.

To switch to the leftmost frame, press M-1

## Compatibility

Emacs 23.x and above. Not tested on older versions.

## Installation

Download frame-tag.el and add this to your .emacs file

    (add-to-list 'load-path "/path/to/frame-tag")
    (require 'frame-tag)
    (frame-tag-mode 1)

## License

Copyright (c) 2012 Wong Liang Zan. GPL v3
