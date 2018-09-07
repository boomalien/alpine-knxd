$ErrorActionPreference = 'Stop';
Write-Host Starting build

if ($isWindows) {
  docker build --pull -t alpine-knxd -f Dockerfile.windows .
} else {
  docker build -t alpine-knxd --build-arg "arch=$env:ARCH" .
}

docker images
