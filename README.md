# FCC Daily Challenges

My solutions to [FreeCodeCamp's Daily Coding Challenges](https://www.freecodecamp.org/learn/daily-coding-challenge/archive) using Haskell with no AI just to keep my fundamentals sharp.


## Setup

### Option A: GHCup

- [GHCup installation](https://www.haskell.org/ghcup/install/)
- Install and set to ghc 9.10.3

  ```bash
  ghcup install ghc 9.10.3
  ghcup set ghc 9.10.3
  ```

### Option B: Nix Flakes

- [Nix installation](https://nixos.org/download/)
- [Enable nix flakes](https://nixos.wiki/wiki/Flakes)
- Enter development shell

  ```bash
  nix develop
  ```


## Running the Tests

- Run all tests
 
  ```bash
  cabal test
  ```

- Run all tests for a specific year example:

  ```bash
  cabal test --test-options="-m Y2026"
  ```

- Run all tests for a specific month example:

  ```bash
  cabal test --test-options="-m Y2026/September"
  ```
