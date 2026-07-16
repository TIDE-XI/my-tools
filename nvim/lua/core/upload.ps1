param([string]$OutFile)

$token = "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"
$repo = "TIDE-XI/images"

# 1. 提取剪贴板图片
Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms
$ok = $false

$img = [System.Windows.Forms.Clipboard]::GetImage()
if ($img) {
  $img.Save($OutFile, [System.Drawing.Imaging.ImageFormat]::Png)
  $ok = $true
}

if (-not $ok) {
  $data = [System.Windows.Forms.Clipboard]::GetDataObject()
  if ($data -and $data.GetDataPresent([System.Windows.Forms.DataFormats]::FileDrop)) {
    $files = $data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    foreach ($f in $files) {
      if ($f -match '\.(png|jpg|jpeg|gif|webp|bmp|avif)$') {
        Copy-Item $f $OutFile -Force
        $ok = $true
        break
      }
    }
  }
}

if (-not $ok) { Write-Output "CLIP_FAIL"; exit 1 }

# 2. base64
$b64 = [Convert]::ToBase64String([IO.File]::ReadAllBytes($OutFile))
Remove-Item $OutFile -Force

# 3. 上传 GitHub（通过 socks5 代理）
$name = [System.IO.Path]::GetFileName($OutFile)
$body = @{ message = "upload $name"; content = $b64; branch = "main" } | ConvertTo-Json
$env:HTTPS_PROXY = "socks5://127.0.0.1:10808"
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

try {
  $resp = Invoke-RestMethod -Uri "https://api.github.com/repos/$repo/contents/img/$name" `
    -Method Put -Headers @{ Authorization = "token $token" } `
    -Body $body -ContentType "application/json" -TimeoutSec 20
  Write-Output $resp.content.download_url
} catch {
  Write-Output "UPLOAD_FAIL"
}
