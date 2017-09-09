#!/bin/bash


# abort on error

source config.sh
IMAGE=$IMAGE_Release_date$IMAGE_Name
IMAGE_ZIP=$IMAGE".zip"
IMAGE_IMG=$IMAGE".img"

# download image and check sha 256 sum
wget --no-clobber https://downloads.raspberrypi.org/raspbian_lite_latest -O $IMAGE_ZIP
DOWNLOADED_IMAGE_SHA_256=$(sha256sum $IMAGE_ZIP | awk '{print $1}')
if [ "$DOWNLOADED_IMAGE_SHA_256" != "$IMAGE_SHA_256" ]
then
	echo $DOWNLOADED_IMAGE_SHA_256
	echo "downloaded image sha-256 sum do not match"
	exit 1
fi

echo "downloaded image sha-256 sum checked and match"
echo ""

echo "extracting zip"
# extract zip and enable
unzip -oxp $IMAGE_ZIP > $IMAGE_IMG

echo "enabling ssh on Raspbian"
mkdir --parents mnt/boot
sudo mount -oloop,offset=$((8192*512)) $IMAGE_IMG mnt/boot
sudo touch mnt/boot/ssh
sudo umount -vvv --force mnt/boot
sudo rm --recursive mnt

echo "####"
echo "Bitte SD Karte für entfernen, falls eingesteckt."
read -p "Dann mit Eingabe/Enter bestätigen."

UNINSERTED_SD_CARD_DF_H=$(df | grep '^/dev' | cut -d' ' -f1)
echo $UNINSERTED_SD_CARD_DF_H

ARRAY_UNINSERTED_SD_CARD_DF_H=($UNINSERTED_SD_CARD_DF_H)

echo "####"
echo "Bitte SD Karte für einstecken."
read -p "Dann mit Eingabe/Enter bestätigen."

INSERTED_SD_CARD_DF_H=$(df | grep '^/dev' | cut -d' ' -f1)
echo $INSERTED_SD_CARD_DF_H

ARRAY_INSERTED_SD_CARD_DF_H=($INSERTED_SD_CARD_DF_H)

DIFF_ARRAY_SD_CARD_DF_H=()
for i in "${ARRAY_INSERTED_SD_CARD_DF_H[@]}"; do
     skip=
     for j in "${ARRAY_UNINSERTED_SD_CARD_DF_H[@]}"; do
         [[ $i == $j ]] && { skip=1; break; }
     done
     [[ -n $skip ]] || DIFF_ARRAY_SD_CARD_DF_H+=("$i")
done
declare -p DIFF_ARRAY_SD_CARD_DF_H

#filter out element not containing 'dev'
FILTERED_ARRAY_SD_CARD_DF_H=$DIFF_ARRAY_SD_CARD_DF_H
FILTERED_ARRAY_SD_CARD_DF_H=(`echo ${DIFF_ARRAY_SD_CARD_DF_H[@]} | sed 's/ /\n/g' | grep dev`)

if [ "${#FILTERED_ARRAY_SD_CARD_DF_H[@]}" -eq "0" ]
then
	echo "no SD Card found"
	exit 1
elif [ "${#FILTERED_ARRAY_SD_CARD_DF_H[@]}" -ne "1" ]
then
	echo "too many SD Cards found"
	exit 1
fi

SD_CARD_PATH=${${FILTERED_ARRAY_SD_CARD_DF_H[0]}::-1}
echo "SD Karte gefunden: $SD_CARD_PATH"

echo "####"
echo "Schreibe auf SD Karte mit $SD_CARD_PATH"
read -p "Dann mit Eingabe/Enter bestätigen."

sudo dd bs=4M status=progress if=$IMAGE_IMG of=$SD_CARD_PATH conv=fsync

echo "Erledigt"

