{ lib, newScope, config }:

lib.makeScope newScope (self: with self; {
  autopair = callPackage ./autopair.nix { };

  buildFishPlugin = callPackage ./build-fish-plugin.nix { };

  colored-man-pages = callPackage ./colored-man-pages.nix { };

  clownfish = callPackage ./clownfish.nix { };

  bass = callPackage ./bass.nix { };

  done = callPackage ./done.nix { };

  # Fishtape 2.x and 3.x aren't compatible,
  # but both versions are used in the tests of different other plugins.
  fishtape = callPackage ./fishtape.nix { };
  fishtape_3 = callPackage ./fishtape_3.nix { };

  foreign-env = callPackage ./foreign-env { };

  forgit = callPackage ./forgit.nix { };

  fzf-fish = callPackage ./fzf-fish.nix { };

  grc = callPackage ./grc.nix { };

  hydro = callPackage ./hydro.nix { };

  pisces = callPackage ./pisces.nix { };

  plugin-git = callPackage ./plugin-git.nix { };

  puffer = callPackage ./puffer.nix { };

  pure = callPackage ./pure.nix { };

  sponge = callPackage ./sponge.nix { };

  tide = callPackage ./tide.nix { };
} // lib.optionalAttrs config.allowAliases {
  autopair-fish = self.autopair; # Added 2023-03-10
})
