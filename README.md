This is MyWormNET2, a [WormNET](http://worms2d.info/WormNET) server written in the [D Programming Language](http://dlang.org/).

# Setup instructions

## Download the source code

You can either:

a) clone the git repository (recommended, if you have or can install [git](http://git-scm.com/)):

    git clone --recursive https://github.com/CyberShadow/MyWormNET2
    cd MyWormNET2

b) or, you could download and unpack the source code using zip files:

   1. Download [MyWormNET2](https://github.com/CyberShadow/MyWormNET2/archive/2372f5ab3726ee1bed762c3bb2b430ea7b7f72b7.zip)
      and the [ae library](https://github.com/CyberShadow/ae/archive/e22dcd2119b4e83196246b09a55b7740eca2916e.zip).
   2. Unpack `MyWormNET2-2372f5ab3726ee1bed762c3bb2b430ea7b7f72b7.zip` and rename the
      `MyWormNET2-e22dcd2119b4e83196246b09a55b7740eca2916e` directory to `MyWormNET2`.
   3. Unpack `ae-e22dcd2119b4e83196246b09a55b7740eca2916e.zip` and move the contents of the
      `ae-e22dcd2119b4e83196246b09a55b7740eca2916e` directory to the empty `MyWormNET2\ae` directory.

Command-line instructions:

    wget https://github.com/CyberShadow/MyWormNET2/archive/2372f5ab3726ee1bed762c3bb2b430ea7b7f72b7.zip
    unzip 2372f5ab3726ee1bed762c3bb2b430ea7b7f72b7.zip
    rm 2372f5ab3726ee1bed762c3bb2b430ea7b7f72b7.zip
    mv MyWormNET2-2372f5ab3726ee1bed762c3bb2b430ea7b7f72b7 MyWormNET2
    cd MyWormNET2
    rmdir ae
    wget https://github.com/CyberShadow/ae/archive/e22dcd2119b4e83196246b09a55b7740eca2916e.zip
    unzip e22dcd2119b4e83196246b09a55b7740eca2916e.zip
    rm e22dcd2119b4e83196246b09a55b7740eca2916e.zip
    mv ae-e22dcd2119b4e83196246b09a55b7740eca2916e ae

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
