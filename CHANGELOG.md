# Changelog

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
