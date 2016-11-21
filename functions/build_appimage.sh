#!/bin/bash
# sed -i -e 's|archive3.h|archive.h|g' ./shared.c
# sed -i -e 's|archive_entry3.h|archive_entry.h|g' ./shared.c
# sed -i -e 's|-larchive3|-larchive|g' ./build.sh
# ./build.sh

# Until this repo stabilizes we will use the appimage.
wget "https://github.com/probonopd/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage"
chmod a+x appimagetool-x86_64.AppImage
mv appimagetool-x86_64.AppImage /app/
