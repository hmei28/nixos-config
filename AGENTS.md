# AGENTS.md

Instructions for AI agents working in this repository.

## Overview

Personal NixOS + Home Manager configuration managed as a flake.
Desktop: Hyprland (Lua config) + DankMaterialShell (DMS). Secrets: SOPS + age.
Single machine (`prsdkplnv01`), single user (`kkroto`), `x86_64-linux`, nixpkgs unstable.

## Structure

```
flake.nix                 # Thin entry point: inputs + wiring only
hosts/
  default.nix             # mkHost orchestrator: host → users `machines` mapping
  prsdkplnv01/            # Per-host: default.nix (feature flags) + configuration.nix + hardware-configuration.nix
homes/
  kkroto/                 # Per-user: SOPS secrets + personal packages
modules/
  nixos/                  # Shared system modules: apps/, desktops/, system/, virtualisation/
  home/                   # Shared home-manager modules: app/, cli/, desktops/, ide/
assets/
  wallpapers/             # PNG files stored via Git LFS
```

## Architecture rules

- **Thin flake, fat modules** — never add logic to `flake.nix`; it only wires inputs and delegates to `hosts/default.nix`.
- **Host × User matrix** — `hosts/default.nix` maps machines to users. Adding a host = one `machines` entry + a `hosts/<hostname>/` directory (copy structure from `prsdkplnv01`).
- **Option-driven modules** — modules declare `options.*` (`lib.mkEnableOption` for booleans, `lib.mkOption` otherwise) and gate their `config` with `lib.mkIf`. Hosts/homes only set flags, e.g. `docker.enable = true;` in `hosts/prsdkplnv01/default.nix`.
- **Register new modules** — import them in the `default.nix` of their directory (`modules/nixos/*/default.nix` or `modules/home/*/default.nix`), never from hosts/homes directly.
- **specialArgs** available everywhere: `hostname`, `username` (primary user), `usernames`, `inputs`, `self`, `lib`.
- **Shared vs personal** — anything reusable goes in `modules/`; anything user-specific (secrets, personal packages) goes in `homes/<user>/`.
- **Flake inputs** — new inputs must set `inputs.nixpkgs.follows = "nixpkgs"`; wire home-manager inputs into the module list in `hosts/default.nix` if needed.

## Commands

```bash
nix flake check                        # Evaluate + validate (must pass)
nixos-rebuild dry-build --flake .      # Full build without switching
nixos-rebuild build --flake .          # Build result link (no switch)
sudo nixos-rebuild switch --flake .    # Apply (interactive machine only — never do this unless asked)
nix flake update                       # Update flake.lock (commit separately)
git lfs install && git lfs pull        # After clone: fetch wallpapers
```

## Conventions

- **Commits**: Conventional Commits — `feat(scope):`, `fix(scope):`, `chore:` (see `git log`). Do not commit unless asked.
- **Indentation**: 2 spaces, Nix standard style. No formatter is configured — match surrounding code.
- **`system.stateVersion` / `home.stateVersion`**: `"24.05"` — never bump.
- **Hyprland (home)**: configured with `configType = "lua"` (Hyprland Lua API), not the classic HCL conf. Bindings/env go in `extraLuaFiles` in `modules/home/desktops/hyprland.nix`.
- **DMS**: settings centralized in `modules/home/desktops/dms-settings.nix` (large attrset); plugins via `dms-plugin-registry` input.
- **Keyboard/locale**: AZERTY (`fr`), locale `en_US.UTF-8` with `fr_FR` formats — set in `modules/nixos/system/i18n.nix`.

## Secrets (guardrails)

- Secrets are **SOPS + age** encrypted files matching `homes/kkroto/*.sops.yaml` (rules in `.sops.yaml`). They are **encrypted in the repo — never try to read, diff, or edit their content directly**; use `sops <file>` on the target machine only.
- **Never** create plaintext secret files, echo/print secret values, or modify `.sops.yaml` creation rules / age keys.
- New secrets: edit via `sops homes/kkroto/secret.sops.yaml` on the machine, then reference them in `homes/kkroto/default.nix` via `sops.secrets.<name>`.
- Age private key lives at `~/.config/age/age.key` on the machine (manual setup, never in git).

## Pitfalls

- `allowUnfree = true` is required — set once in `flake.nix` and `modules/nixos/system/nixos.nix`. Don't remove.
- Hyprland home module sets `package = null` on purpose (avoids duplicate greeter sessions) — keep it.
- `programs.git` is enabled at both system and home level: home manages user config, system provides the binary.
- `direnv`/`nix-direnv` and `comma` are enabled — a dev shell may activate in other projects; don't treat stray `.envrc` effects as part of this config.
- `flake.lock` updates go in their own commit (`feat: flake update`).

## Validation before claiming done

1. `nix flake check` passes (pre-existing warnings are OK, new errors are not).
2. `nixos-rebuild dry-build --flake .` succeeds for the changed configuration.
3. If a module option was added: confirm it is enabled/disabled in the relevant `hosts/` or `homes/` file.
