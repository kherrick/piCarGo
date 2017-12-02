piCarGo
======

A set of scripts to drive a Raspberry Pi connected to Lego and miscellaneous peripherals.

## Requirements:

ServoBlaster:

* Tested against forked version @ [https://github.com/kherrick/PiBits](https://github.com/kherrick/PiBits)

ServoBlaster Setup:

* `cd /tmp`
* `git clone https://github.com/kherrick/PiBits`
* `cd PiBits/ServoBlaster/user`
* `make servod`
* `sudo mv /tmp/PiBits/ServoBlaster/user/servod /usr/local/bin/`

## Post Requirements:

Clone this repository, enter into the directory, and try the included base scripts:

* `./launch-servod.sh`
* `./keyboard-input.sh`
