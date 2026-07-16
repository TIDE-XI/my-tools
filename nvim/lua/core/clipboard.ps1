Add-Type -AssemblyName System.Drawing
Add-Type -AssemblyName System.Windows.Forms
$path = $args[0]
$ok = $false

# 方式1：截图 (Win+Shift+S)
$img = [System.Windows.Forms.Clipboard]::GetImage()
if ($img) {
  $img.Save($path, [System.Drawing.Imaging.ImageFormat]::Png)
  $ok = $true
}

# 方式2：复制的图片文件
if (-not $ok) {
  $data = [System.Windows.Forms.Clipboard]::GetDataObject()
  if ($data -and $data.GetDataPresent([System.Windows.Forms.DataFormats]::FileDrop)) {
    $files = $data.GetData([System.Windows.Forms.DataFormats]::FileDrop)
    foreach ($f in $files) {
      if ($f -match '\.(png|jpg|jpeg|gif|webp|bmp|avif)$') {
        Copy-Item $f $path -Force
        $ok = $true
        break
      }
    }
  }
}

if ($ok) { Write-Output "ok" } else { Write-Output "fail" }
