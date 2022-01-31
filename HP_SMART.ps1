<#
add-appxpackage -path "C:\Users\JasonNolasco\Downloads\HP PRINT\Microsoft.NET.Native.Framework.2.2_2.2.29512.0_x64__8wekyb3d8bbwe.Appx" -ErrorAction 
add-appxpackage -path "C:\Users\JasonNolasco\Downloads\HP PRINT\Microsoft.NET.Native.Runtime.2.2_2.2.28604.0_x64__8wekyb3d8bbwe.Appx"
add-appxpackage -path "C:\Users\JasonNolasco\Downloads\HP PRINT\Microsoft.VCLibs.120.00_12.0.21005.1_x64__8wekyb3d8bbwe.Appx"   
add-appxpackage -path "C:\Users\JasonNolasco\Downloads\HP PRINT\AD2F1837.HPPrinterControl_35.0.97.0_neutral__v10z8vjag6ke6.Appx"
add-appxpackage -path "C:\Users\JasonNolasco\Downloads\HP PRINT\AD2F1837.HPPrinterControl_121.2.195.0_neutral___v10z8vjag6ke6.AppxBundle"
#>


$FRAMEWORK_URL = "http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/4dd135ac-f0f3-4ae8-b910-14e9839b77cf?P1=1643401176&P2=404&P3=2&P4=n3ZCotLxKbO%2fA53qJmP%2fjFCNPEKh7am77Eyyw0TXVdF8W4cKVHgaevPMM%2bZmCVcAuW7Gp191YlonFWqN0bQfxQ%3d%3d"
$RUNTIME_URL = "http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/6c5ccbb5-88d3-4e90-ac79-3880010d81af?P1=1643401119&P2=404&P3=2&P4=TbruCk5klSlrS03xEra%2bqJz7dKLQn4KTrbZO5U1zrc7tXzAALB2MD2TlWCSS1zCUtyG7on1fdvcrzfx%2fs7tO0g%3d%3d"
$VCLIB_URL = "http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/07991083-08a6-4564-8aa5-76b242236669?P1=1643401131&P2=404&P3=2&P4=e7LhzlsKIXOc7HUQ5Ryc%2fCG9GlpoHkteRYHGIjO7zogohFi5VZlknAKCCUDeu8gQR8Z0dqzyCzyBOepS%2bAExmw%3d%3d"
$HPCONTROL_URL = "http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/3e2a1690-952e-4f36-a3f5-dfec4530cddf?P1=1643390678&P2=404&P3=2&P4=Il4PWGQPaMmwlSSuQw3Kjgt6EYrK0bfReQZduc3BR%2f8SpD2vkJUNvXd7XSB4i3j8LY3b0JFOdP%2fZCkRgKy0FhA%3d%3d"
$HPSMART_URL = "http://tlu.dl.delivery.mp.microsoft.com/filestreamingservice/files/ab9e757b-494d-4a26-856d-e781add65606?P1=1643396058&P2=404&P3=2&P4=P7%2byricBeEGYQQBIOogQUUqgJ5PJMPu87mnSYrZeNOEI0XaG15mOPdeYGiAZOvJK8G%2fEZTEFwyvnRlqHSXxwTg%3d%3d"


$DOWNLOAD_FRAMEWORK = "C:\Windows\Temp\HP Smart\Microsoft.NET.Native.Framework.2.2_2.2.29512.0_x64__8wekyb3d8bbwe.Appx"
$DOWNLOAD_RUNTIME = "C:\Windows\Temp\HP Smart\Microsoft.NET.Native.Runtime.2.2_2.2.28604.0_x64__8wekyb3d8bbwe.Appx"
$DOWNLOAD_VCLIB = "C:\Windows\Temp\HP Smart\Microsoft.VCLibs.120.00_12.0.21005.1_x64__8wekyb3d8bbwe.Appx"
$DOWNLOAD_HPCONTROL = "C:\Windows\Temp\HP Smart\AD2F1837.HPPrinterControl_35.0.97.0_neutral__v10z8vjag6ke6.Appx"
$DOWNLOAD_HPSMART = "C:\Windows\Temp\HP Smart\AD2F1837.HPPrinterControl_121.2.195.0_neutral___v10z8vjag6ke6.AppxBundle"

$Path = 'C:\Windows\Temp\HP Smart'

Function newFilePath(){
    if (!(Test-Path -Path 'C:\Windows\Temp\HP Smart'))
        {New-Item -Path $Path -ItemType Directory}
}

# Download file is not happy with accepting parameter.
# Update: Issue was NOT accepting params: Link expires everyday
# Microsoft most likely updates the link on purpose to prevent auto-downloads with scripts
Function file_Download($Download_URL, $FilePath){
    (New-Object System.Net.WebClient).DownloadFile("${Download_URL}", "${FilePath}")
}


Function installFiles(){
    Get-Childitem $Path -filter *.appx| %{Add-AppxPackage -Path $_.FullName} -ErrorAction Ignore
    Get-Childitem $Path -filter *.appxbundle | %{Add-AppxPackage -Path $_.FullName} -ErrorAction Ignore
}


# Will check line 8 if HP Smart is installed: "C:\Program Files\WindowsApps\AD2F1837.HPPrinterControl_35.0.97.0_neutral__v10z8vjag6ke6"
# Will check lines 5 if framework installed: "C:\Program Files\WindowsApps\microsoft.net.native.framework.2.2_2.2.29512.0_x64__8wekyb3d8bbwe"
# Will check lines 6 if framework installed: "C:\Program Files\WindowsApps\microsoft.net.native.runtime.2.2_2.2.28604.0_x64__8wekyb3d8bbwe"

newFilePath
#file_Download($FRAMEWORK_URL, $DOWNLOAD_FRAMEWORK)
#file_Download($RUNTIME_URL, $DOWNLOAD_RUNTIME)
#file_Download($VCLIB_URL, $DOWNLOAD_VCLIB)
#file_Download($HPCONTROL_URL, $DOWNLOAD_HPCONTROL)
#file_Download($HPSMART_URL, $DOWNLOAD_HPSMART)
installFiles
