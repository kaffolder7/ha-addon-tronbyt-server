# Tronbyt Server - Home Assistant App Repository

Run [Tronbyt Server](https://github.com/tronbyt/server) as a Home Assistant app to manage your Tronbyt/Tidbyt displays locally.

![Supports aarch64 Architecture][aarch64-shield] ![Supports amd64 Architecture][amd64-shield] ![Build Status](https://img.shields.io/github/actions/workflow/status/kaffolder7/ha-app-tronbyt-server/test.yml)

## Quick Install (Local App)

1. **Access your apps directory.** Use the Samba or SSH app to access your Home Assistant filesystem. The local apps directory is at `/addons/`.

2. **Copy the `tronbyt-server` folder** from this repository into `/addons/` so you end up with:
   ```
   /addons/tronbyt-server/
   ├── build.yaml
   ├── config.yaml
   ├── Dockerfile
   ├── DOCS.md
   └── run.sh
   ```

3. **Refresh and install.** In Home Assistant, go to **Settings → Apps → App Store**, click the three-dot menu, and select **Check for updates**. You should see **Tronbyt Server** under **Local add-ons**.

4. **Start the app** and access the web UI at `http://<your-HA-IP>:8000`.

## Quick Install (GitHub Repository)

Alternatively, if you host this on GitHub, you can add it as a custom repository:

1. Go to **Settings → Apps → App Store**.
2. Click the three-dot menu → **Repositories**.
3. Add the URL of your GitHub repository.
4. Refresh and install **Tronbyt Server**.

## Supported Architectures

- `aarch64` (Home Assistant Green, RPi 4/5)
- `amd64` (x86-64 PCs)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
