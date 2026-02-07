# Tronbyt Server - Home Assistant App

## Overview

This app runs [Tronbyt Server](https://github.com/tronbyt/server) as a Home Assistant app, letting you manage your Tronbyt (flashed Tidbyt) displays entirely locally — no cloud dependency required.

## Installation

1. Copy (or clone) this repository into your Home Assistant `/addons` directory.
2. In Home Assistant, go to **Settings → Apps → App Store**.
3. Click the three-dot menu (top right) and select **Check for updates**.
4. Find **Tronbyt Server** under **Local add-ons** and click **Install**.
5. Once installed, click **Start**.
6. Access the Tronbyt web UI at `http://<your-HA-IP>:8000`.

## Default Login

- **Username:** `admin`
- **Password:** `password`

Change these immediately after first login.

## Configuration

| Option | Default | Description |
|---|---|---|
| `production` | `true` | Run in production mode |
| `enable_user_registration` | `false` | Allow open user registration |
| `single_user_auto_login` | `false` | Auto-login for single-user setups |
| `github_token` | `""` | GitHub token for accessing private app repos |
| `system_apps_repo` | `""` | Custom Git repository URL for system apps |

## Data Persistence

All Tronbyt data (database, device configs, app caches) is stored persistently across app restarts and updates. The data lives in the app's `/data/tronbyt` directory.

## Network

The app exposes port **8000** for the web UI. Your Tronbyt/Tidbyt devices need to be able to reach this port on your Home Assistant's IP address.

When configuring your Tronbyt device firmware, use your Home Assistant's IP and port 8000 as the server URL (e.g., `http://192.168.1.100:8000`).

## Troubleshooting

- **Can't access the web UI?** Make sure port 8000 is not disabled in the app's network configuration.
- **Devices can't connect?** Ensure your Tronbyt devices are on the same network and can reach the HA IP on port 8000.
- **Check logs:** Go to the app's **Log** tab for detailed startup and runtime information.
