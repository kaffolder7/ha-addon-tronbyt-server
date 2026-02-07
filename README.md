# Home Assistant App: Tronbyt Server

Run [Tronbyt Server](https://github.com/tronbyt/server) as a Home Assistant app.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Build Status][build-shield]

## About

Manage Tronbyt/Tidbyt displays locally from Home Assistant.
- Web UI for configuring and managing displays
- CLI for advanced usage (see upstream docs)
- Supports `aarch64` and `amd64`

## Installation

1. In Home Assistant, go to **Settings → Apps → App store**.
2. Open the App store menu (⋮) → **Repositories**.
3. Add this repository URL:

   `https://github.com/kaffolder7/ha-app-tronbyt-server`

Or add it directly:

[![Open your Home Assistant instance and show the app repository dialog pre-filled.][my-ha-badge]][my-ha-link]

4. Refresh the App Store so the new repository is loaded.
5. Find **Tronbyt Server** and click **Install**.
6. Start the app.

## Usage

- Open the app page and use **Open Web UI** (if enabled), or check the app documentation for access details.
- View logs from the app page to troubleshoot startup/config issues.

## Support

- Issues with the Home Assistant app packaging: [open an issue](https://github.com/kaffolder7/ha-app-tronbyt-server/issues/new) in this repository.
- Issues with Tronbyt Server itself: see the [upstream project](https://github.com/tronbyt/tronbyt-server).

---

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[build-shield]: https://img.shields.io/github/actions/workflow/status/kaffolder7/ha-app-tronbyt-server/test.yml
[my-ha-badge]: https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg
[my-ha-link]: https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fkaffolder7%2Fha-app-tronbyt-server
