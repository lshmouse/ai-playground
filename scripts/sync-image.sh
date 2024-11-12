#!/bin/bash

#!/bin/bash

if [ $# != 2 ]; then
  echo "Usage: $0 image remote-repo"
  exit
fi

image=$1
toImage=registry.qcraftai.com/$2/${image##*/}

echo $toImage

docker pull $image
docker tag $image $toImage
docker push $toImage
