#!/bin/bash

# Define where the command script will be located
COMMAND_SCRIPT="/usr/local/bin/update-discord"

# Check if the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Create or overwrite the update-discord script
cat > "$COMMAND_SCRIPT" << 'EOF'
#!/bin/bash

# Define the URL to download the latest Discord tar.gz
DOWNLOAD_URL="https://discord.com/api/download/stable?platform=linux&format=tar.gz"

# Define the target directory
TARGET_DIR="/opt/Discord"

# Ensure the script is run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Create target directory if it doesn't exist
if [ ! -d "$TARGET_DIR" ]; then
    echo "Creating target directory at $TARGET_DIR"
    mkdir -p "$TARGET_DIR"
fi

# Navigate to the target directory
cd "$TARGET_DIR"

# Download the latest Discord.tar.gz
echo "Downloading Discord.tar.gz from $DOWNLOAD_URL"
wget -O Discord.tar.gz "$DOWNLOAD_URL"

# Extract the downloaded file
echo "Extracting Discord.tar.gz to $TARGET_DIR"
tar -xzf Discord.tar.gz --strip-components=1

# Remove the downloaded tar.gz file
echo "Cleaning up downloaded file"
rm Discord.tar.gz

# Check if the Discord binary is already symlinked in /usr/local/bin
SYMLINK_PATH="/usr/local/bin/discord"
if [ ! -L "$SYMLINK_PATH" ]; then
    # Assuming the Discord executable is named 'Discord'
    # Adjust this if the executable name is different
    if [ -f "$TARGET_DIR/Discord" ]; then
        echo "Creating symlink for Discord in /usr/local/bin"
        ln -s "$TARGET_DIR/Discord" "$SYMLINK_PATH"
    else
        echo "Discord executable not found in $TARGET_DIR"
    fi
else
    echo "Discord is already symlinked to /usr/local/bin"
fi

echo "Discord installation/update completed."

EOF

# Make the command script executable
chmod +x "$COMMAND_SCRIPT"

echo "The update-discord command has been installed successfully."
echo "You can now run 'update-discord' from anywhere in the terminal to update Discord."
