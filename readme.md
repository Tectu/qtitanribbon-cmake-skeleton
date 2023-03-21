# Overview
This is a wrapper to include QtitanRibbon's source code into/via CMake. It provides CMake integration without modifying
any upstream files or directories.

This wrapper has been tested successfully on these platforms:
- FreeBSD
- Linux
- Windows (via MSYS2)

As of right now, this wrapper only supports `QtitanRibbon` for `Qt5`. Adding `Qt6` support should be trivial though.

# Usage
The proprietary nature of the `QtitanRibbon` library prevents us from shipping it alongside this wrapper. Users of this
wrapper need to acquire a copy of the `QtitanRibbon` source code themselves by purchasing a corresponding license.

1. Acquire the `QtitanRibbon` source code
2. Place the following `QtitanRibbon` source code directories into this wrapper's `lib/` directory:
   - `examples/`
   - `include/`
   - `res/`
   - `src/`
   - `translations/`
3. Build the `qtitanribbon-static` or `qtitanribbon-shared` CMake targets as needed.
4. Include one of those targets in your consuming application.


# Examples
The `QtitanRibbon` library ships with a multitude of different examples. This wrapper provides CMake targets for some of them. Adding more targets for upstream examples is easy to achieve. I simply didn't do it because I merely use these targets to test the wrapper/integration itself.
