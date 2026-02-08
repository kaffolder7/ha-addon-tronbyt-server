# Tronbyt Server

Run [Tronbyt Server](https://github.com/tronbyt/server) inside Home Assistant so your Tronbyt (flashed Tidbyt) devices can be managed locally on your network.

## What This App Provides

- A Home Assistant-packaged Tronbyt Server instance
- Web UI exposed on port `8000`
- Persistent storage for server data across restarts and upgrades
- Optional support for private/custom app repositories

## After Installation

1. Open **Settings -> Apps -> Tronbyt Server**.
2. Click **Start**.
3. Open **Web UI** from the app page, or browse to:
   - `http://<home-assistant-ip>:8000`
4. Point your Tronbyt/Tidbyt firmware at that server URL.

Example: `http://192.168.1.100:8000`

## Configuration Options

| Option | Default | Description |
|---|---|---|
| `production` | `true` | Runs Tronbyt in production mode (recommended). |
| `enable_user_registration` | `false` | Allows open account registration in the Tronbyt UI. |
| `single_user_auto_login` | `false` | Automatically signs in a single-user setup. |
| `github_token` | `""` | GitHub token used when accessing private app repositories. |
| `system_apps_repo` | `""` | Optional Git URL for a custom system apps repository. |

Notes:
- Keep `enable_user_registration` disabled unless you specifically need it.
- `github_token` is optional and only needed for private repositories.

## Network

- Default port: `8000/tcp`
- Home Assistant Web UI link is configured automatically.
- Devices on your LAN must be able to reach Home Assistant on port `8000`.

## Data & Persistence

This app persists Tronbyt data under:

- `/data/tronbyt`

The startup script maps Tronbyt's internal data path (`/app/data`) to this persistent location, so state is retained across container restarts and updates.

## Health & Logs

- Watchdog endpoint: `http://<home-assistant-ip>:8000/health`
- Runtime logs: **Settings -> Apps -> Tronbyt Server -> Logs**

## Troubleshooting

- Web UI unavailable:
  - Confirm the app is running.
  - Check Home Assistant host IP and port `8000` reachability.
  - Review app logs for startup errors.
- Device connection issues:
  - Verify device firmware points to `http://<home-assistant-ip>:8000`.
  - Ensure device and Home Assistant are on routable networks.
- Repository/app fetch failures:
  - If using private repos, validate `github_token`.
  - If using `system_apps_repo`, verify the Git URL is reachable and valid.
