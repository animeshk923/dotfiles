#!/bin/bash

# --- Configuration ---
APP_NAME="your-folder-name"
PROJECT_DIR="destination_to_your_app/$APP_NAME"
REPO_URL="your_repo_url_(ssh method)"
BRANCH="main"
NODE_VERSION="24"

# --- 1. Install/Update Node.js ---
echo "⚙️ Checking Node.js..."
if ! command -v node &> /dev/null || [[ $(node -v | cut -d'.' -f1) != "v$NODE_VERSION" ]]; then
    echo "📥 Installing/Updating Node.js to v$NODE_VERSION..."
    curl -fsSL https://deb.nodesource.com/setup_$NODE_VERSION.x | sudo -E bash -
    sudo apt-get install -y nodejs
else
    echo "✅ Node.js v$NODE_VERSION is already installed."
fi

# --- 2. Check/Install PM2 ---
echo "⚙️ Checking PM2..."
if ! command -v pm2 &> /dev/null; then
    echo "📥 PM2 not found. Installing globally..."
    sudo npm install -g pm2
else
    echo "✅ PM2 is already installed."
fi

# --- 3. Clone or Pull Code ---
if [ ! -d "$PROJECT_DIR/.git" ]; then
    echo "🚀 Initial setup: Cloning repository..."
    mkdir -p /home/ubuntu
    git clone $REPO_URL $PROJECT_DIR
    cd $PROJECT_DIR || exit
else
    echo "🚀 Existing project found. Navigating to $PROJECT_DIR..."
    cd $PROJECT_DIR || exit
    echo "📥 Pulling latest changes from $BRANCH..."
    git pull origin $BRANCH
fi

# --- 4. Update Dependencies ---
echo "📦 Updating dependencies..."
npm install --production

# --- 5. Restart Server ---
echo "🔄 Restarting server..."
# If the app is already running, reload it (zero downtime). 
# If not, start it for the first time.
pm2 describe server > /dev/null 2>&1
if [ $? -eq 0 ]; then
    echo "   Reloading existing process..."
#    pm2 reload $APP_NAME
     pm2 reload server
else
    echo "   Starting new process..."
    pm2 start index.js --name $APP_NAME
fi

# Save the PM2 list to ensure it restarts on server reboot
pm2 save

echo "✅ Deployment successful!"

