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



