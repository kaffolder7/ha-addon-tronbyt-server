#!/usr/bin/with-contenv bashio
set -e

echo "[Tronbyt App] Starting up..."

# ---------------------------------------------------------------
# Read Home Assistant app options from /data/options.json
# ---------------------------------------------------------------
OPTIONS_FILE="/data/options.json"

if [ -f "$OPTIONS_FILE" ]; then
    echo "[Tronbyt App] Reading configuration from options.json"

    PRODUCTION=$(jq -r '.production // true' "$OPTIONS_FILE")
    ENABLE_USER_REGISTRATION=$(jq -r '.enable_user_registration // false' "$OPTIONS_FILE")
    SINGLE_USER_AUTO_LOGIN=$(jq -r '.single_user_auto_login // false' "$OPTIONS_FILE")
    GITHUB_TOKEN=$(jq -r '.github_token // ""' "$OPTIONS_FILE")
    SYSTEM_APPS_REPO=$(jq -r '.system_apps_repo // ""' "$OPTIONS_FILE")
else
    echo "[Tronbyt App] No options.json found, using defaults"
    PRODUCTION=true
    ENABLE_USER_REGISTRATION=false
    SINGLE_USER_AUTO_LOGIN=false
    GITHUB_TOKEN=""
    SYSTEM_APPS_REPO=""
fi

# ---------------------------------------------------------------
# Map boolean values to what the tronbyt server expects (1 / 0)
# ---------------------------------------------------------------
bool_to_int() {
    case "$1" in
        true|True|TRUE|1) echo "1" ;;
        *) echo "0" ;;
    esac
}

export PRODUCTION=$(bool_to_int "$PRODUCTION")
export ENABLE_USER_REGISTRATION=$(bool_to_int "$ENABLE_USER_REGISTRATION")
export SINGLE_USER_AUTO_LOGIN=$(bool_to_int "$SINGLE_USER_AUTO_LOGIN")

if [ -n "$GITHUB_TOKEN" ] && [ "$GITHUB_TOKEN" != "null" ]; then
    export GITHUB_TOKEN
fi

if [ -n "$SYSTEM_APPS_REPO" ] && [ "$SYSTEM_APPS_REPO" != "null" ]; then
    export SYSTEM_APPS_REPO
fi

# ---------------------------------------------------------------
# Set up persistent data storage
# ---------------------------------------------------------------
# HA apps persist /data across restarts.
# Tronbyt server stores its data in /app/data.
# Therefore, ensure /app/data points to a persistent location.
PERSISTENT_DIR="/data/tronbyt"
mkdir -p "$PERSISTENT_DIR"

# If /app/data exists and is not a symlink, migrate its contents
if [ -d "/app/data" ] && [ ! -L "/app/data" ]; then
    echo "[Tronbyt App] Migrating existing data to persistent storage..."
    cp -a /app/data/. "$PERSISTENT_DIR/" 2>/dev/null || true
    rm -rf /app/data
fi

# Create symlink so tronbyt writes to persistent storage
ln -sfn "$PERSISTENT_DIR" /app/data

echo "[Tronbyt App] Configuration:"
echo "  PRODUCTION=$PRODUCTION"
echo "  ENABLE_USER_REGISTRATION=$ENABLE_USER_REGISTRATION"
echo "  SINGLE_USER_AUTO_LOGIN=$SINGLE_USER_AUTO_LOGIN"
echo "  SYSTEM_APPS_REPO=${SYSTEM_APPS_REPO:-<default>}"
echo "  Data directory: $PERSISTENT_DIR"
echo ""
echo "[Tronbyt App] Starting Tronbyt Server on port 8000..."
echo "[Tronbyt App] Default credentials: admin / password"
echo ""

# ---------------------------------------------------------------
# Start the Tronbyt server
# ---------------------------------------------------------------
cd /app
exec /app/tronbyt-server
