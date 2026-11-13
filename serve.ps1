# Tiny static file server for previewing the site locally: http://localhost:8080
$root = $PSScriptRoot
$l = New-Object Net.HttpListener
$l.Prefixes.Add("http://localhost:8080/")
$l.Start()
Write-Host "Serving $root on http://localhost:8080"
$types = @{ ".html"="text/html; charset=utf-8"; ".png"="image/png"; ".jpg"="image/jpeg"; ".css"="text/css"; ".js"="application/javascript"; ".svg"="image/svg+xml" }
while ($l.IsListening) {
  $c = $l.GetContext()
  $p = [Uri]::UnescapeDataString($c.Request.Url.AbsolutePath.TrimStart('/'))
  if ($p -eq "") { $p = "index.html" }
  $file = Join-Path $root $p
  if ((Test-Path $file -PathType Leaf) -and ([IO.Path]::GetFullPath($file).StartsWith($root))) {
    $bytes = [IO.File]::ReadAllBytes($file)
    $ext = [IO.Path]::GetExtension($file).ToLower()
    if ($types.ContainsKey($ext)) { $c.Response.ContentType = $types[$ext] }
    $c.Response.OutputStream.Write($bytes, 0, $bytes.Length)
  } else { $c.Response.StatusCode = 404 }
  $c.Response.Close()
}
