#!/bin/bash
#
# build script for lantern-armhf
# ---------------------------------
# github.com/getlantern/lantern
# github.com/arminkz/lanberry

VERSION=5.6.4

echo "cloning lantern..."
git clone https://github.com/getlantern/lantern.git
cd lantern/archive/

# build arm-v7
sed -i 's/GOARM=6/GOARM=7/' Makefile
VERSION=$VERSION make linux-arm
mv lantern_linux_arm lantern-$VERSION-armv7h

# build arm-v6
sed -i 's/GOARM=7/GOARM=6/' Makefile
VERSION=$VERSION make linux-arm
mv lantern_linux_arm lantern-$VERSION-armv6h

mkdir -p lantern/{DEBIAN,lib/systemd/system,usr/bin}/
cp lantern-$VERSION-armv6h lantern/usr/bin/lantern

cat > lantern/DEBIAN/control <<_EOF_
Package: lantern
Version: $VERSION-1
Maintainer: github.com/arminkz
Homepage: https://getlantern.org
Architecture: armhf
Priority: optional
Section: net
Description: Open Internet for Everyone
_EOF_

cat > lantern/lib/systemd/system/lantern.service <<_EOF_
[Unit]
Description=Open Internet for Everyone
Documentation=https://getlantern.org
After=network.target
[Service]
ExecStart=/usr/bin/lantern -addr=0.0.0.0:8787
StandardOutput=null
StandardError=null
Restart=always
[Install]
WantedBy=multi-user.target
_EOF_

dpkg -b lantern lantern_$VERSION_armhf.deb


