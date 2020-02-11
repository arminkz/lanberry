# Lantern for Rapsberry Pi
Build Lantern for armhf devices like Raspberry Pi

[![release](https://img.shields.io/github/release/getlantern/lantern.svg)](https://github.com/getlantern/lantern/releases/latest)

![Alt text](/../master/banner.png?raw=true "Banner")


Manual Build Instructions
-------------------------

install `go` :

```bash
wget https://dl.google.com/go/go1.13.5.linux-armv6l.tar.gz
tar xvzf go1.13.5.linux-armv6l.tar.gz -C /usr/local/
ln -s /usr/local/go/bin/go* /usr/local/bin/
```

install `docker` :

```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=armhf] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

install `Nodejs` and `npm` :

```bash
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
sudo apt install nodejs
```

install `gulp.js` :

```bash
sudo npm install -g gulp-cli
```

clone `lantern` and build: 

```bash
git clone https://github.com/getlantern/lantern.git
cd lantern/archive/
make linux-arm
```

Install and Launch
------------------

```bash
sudo dpkg -i lantern_VERSION_armhf.deb
lantern
```

![Alt text](/../master/screenshot.png?raw=true "Screenshot")

