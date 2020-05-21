#!/bin/sh
FONT_ZIP=$(mktemp)

curl -s https://api.github.com/repos/miiton/Cica/releases/latest \
  | grep "browser_download_url.*with_emoji.zip"  \
  | cut -d : -f 2,3 \
  | tr -d \" \
  | wget -qi - -O ${FONT_ZIP}
unzip ${FONT_ZIP} '*.ttf' -d ${HOME}/Library/Fonts/ && rm ${FONT_ZIP}
echo 'Install: Cica Fonts'
