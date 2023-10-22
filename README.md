LEGO MINDSTORMS EV3 source code - Extended version + docker environment for compilation
===============================

## What this is 
This is the master branch of the development tree used by Robomatter and National Instruments to create the extended firmware.

Additional features include:
* opcodes to turn off auto-id
* opcodes to force a connection type for the sensors
* opcodes to allow additional 3rd party VMs to co-exist with the LMS2012 VM
* Greatly reduced shutdown times
* Fixes for the I2C subsystem
* non-blocking opcodes to access the I2C devices, through additional ioctls

Please note that this does NOT include the sources for the ROBOTC and LabVIEW VMs.  These will be released by their respecive companies on other repositories.  Links will be provided to them here, once this is done.

See [the release announcement on BotBench][1] for more information.

## Credits
* Xander Soldaat, botbench.com/Robomatter
* James Levitt, National Instruments

## What this fork adds
* Dockerfile + scripts to set up the environment
* Added precompiled LabVIEW VM files (libvireo.so and libvireobridge.so)
* Fixed kernel compile error in timeconst.pl

## Things you will need for compilation

* A Linux (virtual) installation. I'm using Ubuntu 22.04 as the docker image uses 16.04 anyways, the host OS should not matter too much.
The reason for the Linux installation requirement is due to the case-sensitive filenames used by the Linux kernel source repository. Attempting to clone the source repository to a non-case sensitive file system such as Mac OSX HFS+ or Windows FAT would result in a corrupted repository.
With docker this theoretically should be fine with any OS, but you would have to modify the Dockerfile to clone the repo directly within the container to preserve case-sensitivity, instead of linking it which I did for smaller image size + ease of access from the host.

* Sourcery G++ Lite 2009q1-203 cross-compilation toolchain from [here](http://www.codesourcery.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2).

## Getting Started

Use Git to clone this repo:

    git clone https://github.com/Chalklate/ev3sources-xtended-docker.git

Obtain CodeSourcery toolchain binaries and extract into the repo:

    wget -c http://www.codesourcery.com/sgpp/lite/arm/portal/package4571/public/arm-none-linux-gnueabi/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2
    
    mkdir ~/ev3sources-xtended-docker/CodeSourcery
    
    tar -jxvf ~/arm-2009q1-203-arm-none-linux-gnueabi-i686-pc-linux-gnu.tar.bz2 -C ~/ev3sources-xtended-docker/CodeSourcery/

Run the build script:

    ./buildDockerImage.sh

Run the container:

    ./runDockerImage.sh
    
Enter the container:

    ./enterShell.sh

Your container is now ready. As a quick test you can do:

    cd /home/ubuntu/projects/lms2012/open_first
    make lms2012

It should compile with no errors.

## To compile a firmware image

    cd /home/ubuntu/projects/lms2012/open_first
    make all
    ./make_image_EDU.sh

The script should run with minimal/no errors. It will still generate an image even with errors, so check carefully.
If successful you should now have a firmware file named ```EV3-image.xxxxx.bin```.
You can flash this with the firmware update tool in EV3 Lab.
    
    
## Contributing

To make changes to the source code, click on the **Fork** button at the top of this page. This will create a copy of this repository under your own GitHub account. You can make changes to this repository as you wish. [See this page for more information about Forking.][2]

If you want to make a change to this shared repo, submit a **Pull Request**, which people can discuss and decide whether to apply your changes or not. [See this page for more information about Pull Requests.][3].

  [1]: http://botbench.com/blog/2014/05/05/ev3-extended-firmware-vm-now-on-github/
  [2]: https://help.github.com/articles/fork-a-repo
  [3]: https://help.github.com/articles/using-pull-requests
  [4]: http://go.mentor.com/2ig4q
  [5]: http://botbench.com/blog/2013/08/15/ev3-creating-console-cable/
  [6]: https://github.com/mindboards/ev3sources/wiki/Eclipse-import
  [7]: http://botbench.com/blog/2013/10/29/ev3-adding-a-pull-tab-to-your-micro-sd-card/
