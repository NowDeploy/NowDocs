$resultFolder = "c:\users\chris\applist"

New-Item -ItemType Directory -Path $resultFolder -ErrorAction SilentlyContinue

$appList = Get-S3Object -BucketName catalog.nowdeploy.com | ? { $_.Key -like "*.xml" }

$mdData = "# NowDeploy Application List`r`n"
$mdData += "The following table shows the applications that are available through NowDeploy:`r`n"
$mdData += "`r`n"
$mdData += "#|Icon|Application Name|Publisher`r`n"
$mdData += "-|-|-|-`r`n"

$i = 0
ForEach($app in $appList) {
    Read-S3Object -BucketName $app.BucketName -Key $app.Key -File $env:temp\appdata.xml | Out-Null
    [xml]$appData = Get-Content "$env:temp\appdata.xml"

    $appName = $appData.NowDeployApplication.Application.Name
    $appPublisher = $appData.NowDeployApplication.Application.Publisher

    if($appName) {
        Write-Host $appName

        $logoBase64 = $appData.NowDeployApplication.Application.Package.Logo
        $outputFile = Join-Path $resultFolder -ChildPath "$($appName).png"
        $bytes = [Convert]::FromBase64String($logoBase64)
        [IO.File]::WriteAllBytes($outputFile, $bytes)
        
        $i++
        $mdData += "$i|![logo]($($appName).png){: style=`"height:50px;width:50px`"}|$appName|$appPublisher`r`n" 
    }
}

$mdData | Out-File $resultFolder\applist.md -Encoding ascii