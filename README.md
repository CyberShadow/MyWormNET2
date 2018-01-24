This is MyWormNET2, a [WormNET](http://worms2d.info/WormNET) server written in the [D Programming Language](http://dlang.org/).

# Setup instructions

## Download the source code

You can either:

a) clone the git repository (recommended, if you have or can install [git](http://git-scm.com/)):

    git clone --recursive https://github.com/CyberShadow/MyWormNET2
    cd MyWormNET2

b) or, you could download and unpack the source code using zip files:

   1. Download [MyWormNET2](https://github.com/CyberShadow/MyWormNET2/archive/b26ee1eef06722c84b562da943b25f55d17c1247.zip)
      and the [ae library](https://github.com/CyberShadow/ae/archive/9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip).
   2. Unpack `MyWormNET2-b26ee1eef06722c84b562da943b25f55d17c1247.zip` and rename the
      `MyWormNET2-9a790b1081b30c765eccc5d83acf1af5b6fc51d4` directory to `MyWormNET2`.
   3. Unpack `ae-9a790b1081b30c765eccc5d83acf1af5b6fc51d4.zip` and move the contents of the
      `ae-9a790b1081b30c765eccc5d83acf1af5b6fc51d4` directory to the empty `MyWormNET2\ae` directory.

Command-line instructions:

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

## Install D

You'll need a D compiler to compile MyWormNET2.

For Windows, OS X, and Debian/RPM-based Linux distributions, you can use one of the installers/packages from the [D website](http://dlang.org/download.html).

On POSIX systems, you can also use the install script:

    curl -fsS https://dlang.org/install.sh | bash -s dmd

## Configure MyWormNET2

Copy the file `mywormnet2-sample.ini` to `mywormnet2.ini`, and edit it accordingly.
See the comments for explanations of what the various options do.

## Compile and run MyWormNET2

To build and run MyWormNET2, use `rdmd`:

    rdmd mywormnet2

If you'd like to just build an executable, use `--build-only`:

    rdmd --build-only mywormnet2
