# Display and Resolution Toggle Automation

This project contains a series of batch scripts designed to automate the process of extending displays, switching to second displays, and toggling between 4K and 1920x1080 (1080p) resolutions on Windows. These scripts utilize a combination of Windows built-in commands and VBScript to control display settings with minimal user interaction.

## Table of Contents

- [Files](#files)
- [Features](#features)
- [Installation](#installation)
- [Troubleshooting](#troubleshooting)

## Files


### DisplaySwitchExtend.bat

This script extends the primary display to another connected display (usually in dual monitor setups).

### DisplaySwitchSecond.bat

This script switches the output to an external monitor only (useful for presentations or when using a single external display such as a TV).

### Resolution4K.bat

This script opens Windows Display Settings and automates the process of selecting and applying a 4K resolution (3840x2160) using a VBScript-based key automation sequence (in my case for my 4K TV).

### Resolution1920p.bat

This script automates the process of switching to a 1920x1080 resolution using a similar method to the `Resolution4K.bat`.

### ResolutionToggle.bat

This script detects the current resolution of the primary display and toggles between 4K and 1920x1080. It checks the current resolution using `wmic` and calls the appropriate script to switch between them.

## Features

- **DisplaySwitchExtend.bat**: Extend your desktop across two monitors.
- **DisplaySwitchSecond.bat**: Switch the display output to an external monitor only.
- **Resolution4K.bat**: Automate switching to 4K resolution.
- **Resolution1920p.bat**: Automate switching to 1920x1080 resolution.
- **ResolutionToggle.bat**: Toggle between 4K and 1080p resolutions based on the current resolution.

## Installation

1. Clone this repository to your local machine:

    ```bash
    git clone https://github.com/yourusername/display-resolution-toggle.git
    ```

2. Ensure that your system allows the execution of `.bat` files. You may need to configure your system to allow batch script execution, depending on your security settings.

3. Copy the scripts to a directory that is accessible via the command line, or add the directory to your `PATH` environment variable for easier access.

4. Create shortcuts to the 2 DisplaySwitch scripts and the Resolution Toggle script on your desktop or start menu.

## Troubleshooting

Depending on various graphics card or windows set ups, you may need to edit the number of tabs and cursor arrow moves that the Resolution scripts make in order to reach the desired field for display resolution on the windows settings page and the desired resolution in the drop down box. Manually operate the procedure and count the number of steps needed and adjust accordingly.