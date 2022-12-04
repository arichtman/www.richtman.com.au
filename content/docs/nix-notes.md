+++
title = "Nix Notes"
date = 2022-12-03T05:39:55Z
description = "Personal notes on Nix/NixOS"
[taxonomies]
categories = [ "Technical" ]
tags = ["nix", "nixos", "reference" ]
+++

- All dependencies are static, i.e. there's no loose version constraints
- Parallel versions of _everything_ (including derivations) are installed to `/nix/store`
- Derivations, including your current system configuration, are factored into the dependency tree
- Installed packages are immutable
- Nix CLI v2 is unclear, try to stick to v3. [Reference](https://nixos.org/manual/nix/stable/command-ref/new-cli/nix.html)
- Context for your current derivation is stored at `~/.nix-profile`, it's mostly symlinks to other stuff though
- Channels are your package sources
- Derivations themselves only yield `.drv` files, you must _realize_ a derivation to produce usable output
- Shebangs should not use `/usr/bin/env` as this ruins the hermeticity
- Shebangs also should not use absolute paths, as we reference things in the nix store via symlinks and `PATH`
- Nixpkgs provides a lot of stuff for free, including variables that point to the store directory for packages, like `$bash`, `$gcc`, and `$coreutils`
- We can reference these on our derivation specifications, as well as pass them through to build scripts using `inherit`
- Builds deliberately remove `$HOME` and `$PATH` to preserve stateless, portable builds
- Build scripts can/should reference `$out`, which is the path to put any files that are to be in the realized derivation
- _NAR_s are Nix ARchives that are simple and deterministic
