if (-not (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA")) {
    Write-Host "Please run the script as administrator"
    exit
}

function IsVCInstalled($version) {
    $key = "HKLM:\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x64"
    $key32 = "HKLM:\SOFTWARE\Microsoft\VisualStudio\14.0\VC\Runtimes\x86"
    if (Test-Path $key -or Test-Path $key32) {
        return $true
    } else {
        return $false
    }
}

Write-Host "Checking if C++ Redistributables are installed..."
$installedVC2015 = IsVCInstalled("2015")
$installedVC2017 = IsVCInstalled("2017")
$installedVC2019 = IsVCInstalled("2019")
$installedVC2022 = IsVCInstalled("2022")

if (-not $installedVC2015) {
    Write-Host "C++ Redistributable 2015 not found. Installing..."
    $vc2015Installer = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
    Invoke-WebRequest -Uri $vc2015Installer -OutFile "$env:USERPROFILE\vc2015.exe"
    Start-Process -FilePath "$env:USERPROFILE\vc2015.exe" -ArgumentList "/quiet" -Wait
    Remove-Item "$env:USERPROFILE\vc2015.exe"
}

if (-not $installedVC2017) {
    Write-Host "C++ Redistributable 2017 not found. Installing..."
    $vc2017Installer = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
    Invoke-WebRequest -Uri $vc2017Installer -OutFile "$env:USERPROFILE\vc2017.exe"
    Start-Process -FilePath "$env:USERPROFILE\vc2017.exe" -ArgumentList "/quiet" -Wait
    Remove-Item "$env:USERPROFILE\vc2017.exe"
}

if (-not $installedVC2019) {
    Write-Host "C++ Redistributable 2019 not found. Installing..."
    $vc2019Installer = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
    Invoke-WebRequest -Uri $vc2019Installer -OutFile "$env:USERPROFILE\vc2019.exe"
    Start-Process -FilePath "$env:USERPROFILE\vc2019.exe" -ArgumentList "/quiet" -Wait
    Remove-Item "$env:USERPROFILE\vc2019.exe"
}

if (-not $installedVC2022) {
    Write-Host "C++ Redistributable 2022 not found. Installing..."
    $vc2022Installer = "https://aka.ms/vs/17/release/vc_redist.x64.exe"
    Invoke-WebRequest -Uri $vc2022Installer -OutFile "$env:USERPROFILE\vc2022.exe"
    Start-Process -FilePath "$env:USERPROFILE\vc2022.exe" -ArgumentList "/quiet" -Wait
    Remove-Item "$env:USERPROFILE\vc2022.exe"
}

Write-Host "Installing Node.js..."
$nodeInstaller = "https://nodejs.org/dist/v18.16.0/node-v18.16.0-x64.msi"
$nodePath = "C:\Program Files\nodejs"
Invoke-WebRequest -Uri $nodeInstaller -OutFile "$env:USERPROFILE\nodejs.msi"
Start-Process -FilePath "$env:USERPROFILE\nodejs.msi" -ArgumentList "/quiet" -Wait
Remove-Item "$env:USERPROFILE\nodejs.msi"

$env:Path += ";$nodePath"

Write-Host "Updating npm..."
npm install -g npm

Write-Host "Installing Yarn..."
npm install -g yarn

Write-Host "Installing Git..."
$gitInstaller = "https://git-scm.com/download/win"
Invoke-WebRequest -Uri $gitInstaller -OutFile "$env:USERPROFILE\GitSetup.exe"
Start-Process -FilePath "$env:USERPROFILE\GitSetup.exe" -ArgumentList "/VERYSILENT" -Wait
Remove-Item "$env:USERPROFILE\GitSetup.exe"

Write-Host "Installing JDK..."
$jdkInstaller = "https://download.oracle.com/java/17/latest/jdk-17_windows-x64_bin.exe"
Invoke-WebRequest -Uri $jdkInstaller -OutFile "$env:USERPROFILE\JDKSetup.exe"
Start-Process -FilePath "$env:USERPROFILE\JDKSetup.exe" -ArgumentList "/quiet" -Wait
Remove-Item "$env:USERPROFILE\JDKSetup.exe"
$jdkPath = "C:\Program Files\Java\jdk-17"
[Environment]::SetEnvironmentVariable("JAVA_HOME", $jdkPath, [System.EnvironmentVariableTarget]::User)
$env:Path += ";$jdkPath\bin"

Write-Host "Installing Flutter SDK..."
$flutterInstaller = "https://storage.googleapis.com/flutter_infra_release/releases/stable/windows/flutter_windows_3.13.3-stable.zip"
$flutterPath = "C:\flutter"
Invoke-WebRequest -Uri $flutterInstaller -OutFile "$env:USERPROFILE\flutter.zip"
Expand-Archive "$env:USERPROFILE\flutter.zip" -DestinationPath $flutterPath
Remove-Item "$env:USERPROFILE\flutter.zip"
[Environment]::SetEnvironmentVariable("FLUTTER_HOME", $flutterPath, [System.EnvironmentVariableTarget]::User)
$env:Path += ";$flutterPath\bin"

Write-Host "Installing Visual Studio Code..."
$vsCodeInstaller = "https://aka.ms/win32-x64-user-stable"
Invoke-WebRequest -Uri $vsCodeInstaller -OutFile "$env:USERPROFILE\VSCodeSetup.exe"
Start-Process -FilePath "$env:USERPROFILE\VSCodeSetup.exe" -ArgumentList "/silent" -Wait
Remove-Item "$env:USERPROFILE\VSCodeSetup.exe"

Write-Host "Installing Android Studio..."
$androidStudioInstaller = "https://dl.google.com/dl/android/studio/ide-zips/2023.1.1.20/android-studio-2023.1.1.20-windows.zip"
Invoke-WebRequest -Uri $androidStudioInstaller -OutFile "$env:USERPROFILE\android-studio.zip"
Expand-Archive "$env:USERPROFILE\android-studio.zip" -DestinationPath "$env:ProgramFiles\Android Studio"
Remove-Item "$env:USERPROFILE\android-studio.zip"

Write-Host "Installing Dart SDK..."
$dartInstaller = "https://storage.googleapis.com/download.dartlang.org/dart-archive/channels/stable/release/latest/sdk/dart-sdk-windows-x64.zip"
$dartPath = "C:\dart"
Invoke-WebRequest -Uri $dartInstaller -OutFile "$env:USERPROFILE\dart.zip"
Expand-Archive "$env:USERPROFILE\dart.zip" -DestinationPath $dartPath
Remove-Item "$env:USERPROFILE\dart.zip"
[Environment]::SetEnvironmentVariable("DART_HOME", $dartPath, [System.EnvironmentVariableTarget]::User)
$env:Path += ";$dartPath\bin"

Write-Host "Installing Postman..."
$postmanInstaller = "https://dl.pstmn.io/download/latest/win64"
Invoke-WebRequest -Uri $postmanInstaller -OutFile "$env:USERPROFILE\PostmanSetup.exe"
Start-Process -FilePath "$env:USERPROFILE\PostmanSetup.exe" -ArgumentList "/silent" -Wait
Remove-Item "$env:USERPROFILE\PostmanSetup.exe"

Write-Host "Installing Windows Subsystem for Android..."
$wsaInstaller = "https://github.com/MustardChef/WSABuilds/releases/download/Windows_10_2311.40000.5.0_LTS_3/WSA_2311.40000.5.0_x64_Release-Nightly-GApps-13.0-NoAmazon_Windows_10.7z"
$wsaFolder = "C:\WSA"
Invoke-WebRequest -Uri $wsaInstaller -OutFile "$env:USERPROFILE\WSA_Release.7z"
Start-Process -FilePath "7z.exe" -ArgumentList "x", "$env:USERPROFILE\WSA_Release.7z", "-o$wsaFolder" -Wait
Remove-Item "$env:USERPROFILE\WSA_Release.7z"
Start-Process -FilePath "$wsaFolder\Run.bat" -Wait

Write-Host "Installing Flutter DevTools..."
flutter pub global activate devtools

Write-Host "Installing GitHub CLI..."
$ghInstaller = "https://github.com/cli/cli/releases/download/v2.28.0/gh_2.28.0_windows_amd64.msi"
Invoke-WebRequest -Uri $ghInstaller -OutFile "$env:USERPROFILE\ghSetup.msi"
Start-Process -FilePath "$env:USERPROFILE\ghSetup.msi" -ArgumentList "/quiet" -Wait
Remove-Item "$env:USERPROFILE\ghSetup.msi"

Write-Host "Installing Python..."
$pythonInstaller = "https://www.python.org/ftp/python/3.11.4/python-3.11.4-amd64.exe"
Invoke-WebRequest -Uri $pythonInstaller -OutFile "$env:USERPROFILE\pythonSetup.exe"
Start-Process -FilePath "$env:USERPROFILE\pythonSetup.exe" -ArgumentList "/quiet" -Wait
Remove-Item "$env:USERPROFILE\pythonSetup.exe"
$pythonPath = "C:\Program Files\Python\Python311"
[Environment]::SetEnvironmentVariable("PYTHON_HOME", $pythonPath, [System.EnvironmentVariableTarget]::User)
$env:Path += ";$pythonPath"

[Environment]::SetEnvironmentVariable("Path", "$env:Path;$flutterPath\bin;$dartPath\bin;$nodePath;$env:ProgramFiles\Android\Android Studio\bin", [System.EnvironmentVariableTarget]::User)
[Environment]::SetEnvironmentVariable("JAVA_HOME", "C:\Program Files\Java\jdk-17", [System.EnvironmentVariableTarget]::User)

Write-Host "Ensuring keytool works..."
$env:Path += ";C:\Program Files\Android\Android Studio\bin\studio.exe"

Write-Host "Setup complete! Restarting the PC..."
shutdown.exe /r /t 0
