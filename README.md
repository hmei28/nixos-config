# NixOS Config

Declarative NixOS + home-manager configuration managed via flake.

Everything is declarative except secrets (SOPS + age) and service logins
(rbw, Bitwarden) which require manual one-time setup.

## Prerequisites

- NixOS with flakes enabled
- Git
- Git LFS (for wallpapers): `git lfs install && git lfs pull`

## Structure

```
nixos-config/
├── flake.nix                  # Inputs + outputs (thin entry point)
├── hosts/
│   ├── default.nix            # Host → users mapping (mkHost orchestrator)
│   └── prsdkplnv01/           # Per-host: hardware + feature flags
├── homes/
│   └── kkroto/                # Per-user: secrets (SOPS), personal packages
├── modules/
│   ├── home/                  # Shared home-manager modules
│   │   ├── app/               # GUI apps (kitty, zen-browser, vlc, etc.)
│   │   ├── cli/               # CLI tools by theme (k8s, git, security, etc.)
│   │   ├── desktops/          # Hyprland + DankMaterialShell + theming
│   │   └── ide/               # Editors (neovim, vscode)
│   └── nixos/                 # Shared NixOS system modules
│       ├── apps/              # Steam
│       ├── desktops/          # Hyprland (system-level)
│       ├── system/            # Boot, network, sound, users, yubikey, etc.
│       └── virtualisation/    # Docker, VirtualBox
└── assets/
    └── wallpapers/            # Wallpapers (Git LFS)
```

### Architecture

- **Thin flake, fat modules** — flake.nix only wires inputs and delegates
- **Host × User matrix** — `hosts/default.nix` maps machines to users; adding a host is one line
- **Option-driven** — modules expose `mkEnableOption` flags; hosts/homes compose by setting them
- **Shared vs personal** — everything reusable in `modules/`, everything personal in `homes/<user>/`

## Commands

```bash
nix flake check                # Validate
nixos-rebuild build --flake .  # Build (no switch)
sudo nixos-rebuild switch --flake .  # Apply
```

## Post-install manual steps

After first `nixos-rebuild switch`:

1. **SOPS age key** — generate and place at `~/.config/age/age.key`
2. **rbw (Bitwarden CLI)** — `rbw config` then `rbw login`
3. **Git LFS** — `git lfs install && git lfs pull` (if not done pre-switch)

## Notes

- Desktop: Hyprland + DankMaterialShell (DMS), configured via Lua API
- Theming: matugen dynamic theming (catppuccin), adapts light/dark
- DMS plugins: managed declaratively via Nix (dms-plugin-registry)
- Secrets: SOPS + age, encrypted per-user under `homes/<user>/`
- Keyboard: AZERTY (fr), locale en_US with fr_FR regional formats
