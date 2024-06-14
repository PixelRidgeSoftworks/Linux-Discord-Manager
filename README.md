# Linux Discord Manager

Welcome to the Linux Discord Manager repository! This script is designed to simplify the process of installing and updating Discord on Linux systems (that don't update their package repos frequently like Manjaro). It ensures you always have the latest version of Discord with just one command.

## Features

   - Automated Installation: Downloads and installs the latest version of Discord.
   - Easy Updates: Quickly update Discord to the latest version using a single command.
   - Symlink Creation: Creates a symlink to make running Discord from the terminal easy.

## Requirements

   - Linux operating system
   - Root privileges
   - Discord not installed (or uninstalled)

## Installation

To install the Discord Auto Script, follow these steps:

   - Clone the repository:

```bash
    git clone https://github.com/PixelRidge-Softworks/Linux-Discord-Manager.git
    cd discord-auto-update
```

   - Make the script executable and run it:

```bash

    chmod +x setup.sh
    sudo ./global_installer.sh
```

## Usage

Once installed, you can update Discord to the latest version easily. When Discord says there's an update, simply run:

```bash

sudo update-discord
```

This command will:

   - Download the latest Discord tar.gz file.
   - Extract it to the /opt/Discord directory.
   - Create a symlink in /usr/local/bin for easy terminal access.

Then re-launch discord, and it will install its update!

### NOTE: The `update-discord` command will also install discord for you if it's not already installed. So if you don't have Discord yet, install it that way so we can manage it instead of your package manager!

## Contributing

We welcome contributions to enhance the functionality and usability of this script. To contribute:

   - Fork the repository.
   - Create a new branch (git checkout -b feature-branch).
   - Make your changes.
   - Commit your changes (git commit -am 'Add new feature').
   - Push to the branch (git push origin feature-branch).
   - Open a Pull Request.

License

This project is licensed under the MIT License. See the LICENSE file for more details.

This script is developed and maintained by **PixelRidge Softworks**. For more information about our products and services [visit our website](https://pixelridgesoftworks.com).

Feel free to open issues or submit pull requests for any improvements or bugs. Thank you for using our script!
