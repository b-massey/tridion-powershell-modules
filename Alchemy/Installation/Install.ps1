#Requires -Version 3.0

# Do not continue if there's an error
$ErrorActionPreference = 'Stop';

$branch = 'feature/shared-installation';

# Base URL to download the latest version from the internet
$baseDownloadUrl = "https://raw.githubusercontent.com/pkjaer/tridion-powershell-modules/${branch}/Alchemy";

# List of all the files to install
$directories = @("Installation");
$files = @(
	'Installation/Install.ps1',
	'Installation/Verify.ps1',
	'Plugins.psm1', 
	'Settings.psm1', 
	'Tridion-Alchemy.psd1'
);

	
# Download the installation script
wget "https://raw.githubusercontent.com/pkjaer/tridion-powershell-modules/${branch}/Shared/Installation/Install-ModuleFromWeb.ps1" | iex

# Install the above files and directories
Install-ModuleFromWeb("Tridion-Alchemy", $baseDownloadUrl, $files, $directories);
