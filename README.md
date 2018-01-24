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

   1. Download [MyWormNET2](https://github.com/CyberShadow/MyWormNET2/archive/v1.0.0.zip)
      and the [ae library](https://github.com/CyberShadow/ae/archive/v0.0.2097.zip).
   2. Unpack `MyWormNET2-v1.0.0.zip` and rename the
      `MyWormNET2-v0.0.2097` directory to `MyWormNET2`.
   3. Unpack `ae-v0.0.2097.zip` and move the contents of the
      `ae-v0.0.2097` directory to the empty `MyWormNET2\ae` directory.

Command-line instructions (again, not recommended):

    wget https://github.com/CyberShadow/MyWormNET2/archive/v1.0.0.zip
    unzip v1.0.0.zip
    rm v1.0.0.zip
    mv MyWormNET2-v1.0.0 MyWormNET2
    cd MyWormNET2
    rmdir ae
    wget https://github.com/CyberShadow/ae/archive/v0.0.2097.zip
    unzip v0.0.2097.zip
    rm v0.0.2097.zip
    mv ae-v0.0.2097 ae

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

## Configure Worms Armageddon

In order to connect to your MyWormNET2 server, players need to customize their `ServerList.htm` file. The file is found by default at: `graphics\ServerLobby\ServerList.htm`.

Alternatively, you could get your server listed in the [WormNET server list](http://worms.thecybershadow.net/wormnet/).
