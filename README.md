This is MyWormNET2, a [WormNET](http://worms2d.info/WormNET) server written in the [D Programming Language](http://dlang.org/).

# Setup instructions

## Download the source code

You can either:

a) clone the git repository (recommended, if you have or can install [git](http://git-scm.com/):

    git clone --recursive https://github.com/CyberShadow/MyWormNET2
    cd MyWormNET2

b) or, you could download and unpack the source code using zip files:
   [MyWormNET2](https://github.com/CyberShadow/MyWormNET2/archive/master.zip) and the [ae library](https://github.com/CyberShadow/ae/archive/master.zip).
   Unpack `ae-master.zip` to the empty `ae` directory in `MyWormNET2-master.zip`.
   Command-line instructions:

    wget https://github.com/CyberShadow/MyWormNET2/archive/master.zip
    unzip master.zip
    mv MyWormNET2-master MyWormNET2
    cd MyWormNET2
    rmdir ae
    wget https://github.com/CyberShadow/ae/archive/master.zip
    unzip master.zip
    rm master.zip
    mv ae-master ae

## Install D

You'll need a D compiler to compile MyWormNET2.

For Windows, OS X, and Debian/RPM-based Linux distributions, you can use one of the installers/packages from the [D website](http://dlang.org/download.html).

If you need to run MyWormNET2 on a Linux system and don't have root access, you can use [DVM](https://bitbucket.org/doob/dvm) to install DMD to your home directory.
After installing DVM (see instructions on DVM's project page), use the `dvm install 2.064.2` command to install a D compiler, then `dvm use 2.064.2 -d` to activate it.
See the [D website](http://dlang.org/download.html) to get the version number for the latest D compiler.

## Configure MyWormNET2

Copy the file `mywormnet2-sample.ini` to `mywormnet2.ini`, and edit it accordingly.
See the comments for explanations of what the various options do.

## Compile and run MyWormNET2

To build and run MyWormNET2, use `rdmd`:

    rdmd mywormnet2

If you'd like to just build an executable, use `--build-only`:

    rdmd --build-only mywormnet2
