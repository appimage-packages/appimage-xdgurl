#!/bin/bash

# Run linuxdeployqt to bring in proper libs
find $HOME/build-*-*_Qt_* \( -name "moc_*" -or -name "*.o" -or -name "qrc_*" -or -name "Makefile*" -or -name "*.a" \) -exec rm {} \;
cd /
mkdir /xdgurl.AppDir/
mv /app/usr /xdgurl.AppDir/usr
cp  -v  /xdgurl.AppDir/usr/share/applications/xdgurl.desktop /xdgurl.AppDir
cp  -v /xdgurl.AppDir/usr/share/icons/hicolor/scalable/apps/xdgurl.svg /xdgurl.AppDir
wget https://github.com/probonopd/linuxdeployqt/releases/download/1/linuxdeployqt-1-x86_64.AppImage
chmod a+x linuxdeployqt-1-x86_64.AppImage

DESTIDIR=/xdgurl.AppDir ./linuxdeployqt-1-x86_64.AppImage /xdgurl.AppDir/usr/bin/xdgurl

# Until this repo stabilizes we will use the appimage.
# Build AppImageKit

wget "https://github.com/probonopd/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod a+x appimagetool-x86_64.AppImage

VERSION=<%= version %>
ARCH=x86_64
APP=<%= name %>

./appimagetool-x86_64.AppImage /xdgurl.AppDir /appimage/xdgurl-$(date)-$(arch).AppImage
