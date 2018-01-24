This is MyWormNET2, a [WormNET](http://worms2d.info/WormNET) server written in the [D Programming Language](http://dlang.org/).

# Setup instructions

## Install D

You'll need a D compiler to compile MyWormNET2.

For Windows, OS X, and Debian/RPM-based Linux distributions, you can use one of the installers/packages from the [D website](http://dlang.org/download.html).

On POSIX systems, you can also use the install script:

    curl -fsS https://dlang.org/install.sh | bash -s dmd

## Get MyWormNET2

### Get MyWormNET2 using Dub

Using `dub` (included with DMD) is the simplest method to get MyWormNET2 running.

In a terminal / command prompt, run:

    dub fetch mywormnet2

MyWormNET2 will be downloaded to Dub's package directory (`$HOME/.dub/packages/mywormnet2-*/mywormnet2/`).

### Get MyWormNET2 using Git

This will fetch MyWormNET2 and its dependencies:

    git clone --recursive https://github.com/CyberShadow/MyWormNET2
    cd MyWormNET2

### Get MyWormNET2 manually

You can also download and unpack the source code using zip files (not recommended):

   1. Download [MyWormNET2](https://github.com/CyberShadow/MyWormNET2/archive/b26ee1eef06722c84b562da943b25f55d17c1247.zip)
      and the [ae library](https://github.com/CyberShadow/ae/archive/9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip).
   2. Unpack `MyWormNET2-b26ee1eef06722c84b562da943b25f55d17c1247.zip` and rename the
      `MyWormNET2-9a790b1081b30c765eccc5d83acf1af5b6fc51d4` directory to `MyWormNET2`.
   3. Unpack `ae-9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip` and move the contents of the
      `ae-9a790b1081b30c765eccc5d83acf1af5b6fc51d4` directory to the empty `MyWormNET2\ae` directory.

Command-line instructions (again, not recommended):

    wget https://github.com/CyberShadow/MyWormNET2/archive/b26ee1eef06722c84b562da943b25f55d17c1247.zip
    unzip b26ee1eef06722c84b562da943b25f55d17c1247.zip
    rm b26ee1eef06722c84b562da943b25f55d17c1247.zip
    mv MyWormNET2-b26ee1eef06722c84b562da943b25f55d17c1247 MyWormNET2
    cd MyWormNET2
    rmdir ae
    wget https://github.com/CyberShadow/ae/archive/9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip
    unzip 9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip
    rm 9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip
    mv ae-9a790b1081b30c765eccc5d83acf1af5b6fc51d4 ae

## Configure MyWormNET2

Copy the file `mywormnet2-sample.ini` to `mywormnet2.ini`, and edit it accordingly.

MyWormNET2 will look for its files in the current directory. See the comments for explanations of what the various options do.

## Compile and run MyWormNET2

### Using dub

To build and run MyWormNET2 with Dub, run:

    dub run mywormnet2

If you'd like to just build an executable, use `build` instead of `run`:

    dub build mywormnet2

### Using rdmd

To build and run MyWormNET2 with `rdmd`, run:

    rdmd mywormnet2

If you'd like to just build an executable, use `--build-only`:

    rdmd --build-only mywormnet2
