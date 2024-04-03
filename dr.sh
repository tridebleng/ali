#!/bin/bash
echo -e "Waitting install gdrive upload"
cd /bin
apigd=$(wget -qO- 'https://docs.google.com/uc?export=download&id=1ituL7mjsYsZ8rqSXYutd8zxpt1EEaskQ' | grep "#apigd" | awk '{print $2}')
gdrive=$(wget -qO- 'https://docs.google.com/uc?export=download&id=1ituL7mjsYsZ8rqSXYutd8zxpt1EEaskQ' | grep "#gdrive" | awk '{print $2}')
wget -q -O gdrive "$gdrive"
mkdir -p /root/.gdrive
wget -q -O /root/.gdrive/token_v2.json "$apigd"
rm -r setup
echo -e "Done install Gdrive upload"
