# Changelog

## 0.1.6
- Hardened startup data migration to prevent silent copy failures from deleting existing `/app/data` contents.
- Redacted credentials from `system_apps_repo` in startup logs to reduce accidental secret exposure.
- Switched AppArmor profile from `complain` mode to enforced mode.
- Removed static watchdog metadata to avoid restart loops when `/health` behavior differs across Tronbyt versions.
- Updated docs to describe `/health` as an optional endpoint depending on the installed Tronbyt release.

## 0.1.5
- Added localization for application configuration settings with German, English, and Spanish translations to improve accessibility.
- Cleaned up `README.md` by updating installation instructions and adding a link to the upstream project.
- Organized `config.yaml` to match [HA documentation](https://developers.home-assistant.io/docs/apps/configuration/) and improve readability and maintainability.

## 0.1.4
- Update `config.yaml` to remove risky mounts + improve secrets handling
- Add a custom `apparmor.txt` (security score + defense-in-depth)
- Supply-chain: pin `tronbyt/server` upstream image version to `2.1.2`.

## 0.1.3
- Fix container publishing to [GitHub Container Registry](https://github.com/features/packages) so images are published under the correct repository path (no duplicated `ghcr.io/kaffolder7/` prefix).

## 0.1.2
- Standardize published container image naming to the Home Assistant convention: `ghcr.io/kaffolder7/{arch}-app-tronbyt-server:<version>`.
- Add-on now pulls pre-built images from GHCR (no local build required on install/update).
- Update CI builder arguments formatting so architecture flags are correctly passed during workflow runs.

## 0.1.1
- Add `webui` metadata so Home Assistant shows an "Open Web UI" button for quick access to the Tronbyt UI (`http://[HOST]:[PORT:8000]`).

## 0.1.0
- Initial release of the Tronbyt Server Home Assistant app.
- Runs Tronbyt Server (based on `ghcr.io/tronbyt/server:2`) on Home Assistant.
- Exposes the Tronbyt web UI on port 8000.
- Persists Tronbyt data under `/data/tronbyt` across restarts/updates.
- Adds configuration options:
  - production mode
  - enable user registration
  - single-user auto login
  - GitHub token (optional)
  - system apps repo override (optional)
- Includes install + usage documentation.
