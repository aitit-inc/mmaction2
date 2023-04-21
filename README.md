# MMAction2

## Requirements
- docker
- GPU

## Install
```shell
bin/build.sh
```

## Run demo
Refer: https://mmaction2.readthedocs.io/en/latest/get_started/installation.html

```shell
docker compose run -i app /bin/bash

# In the running container

# Download model and code for demo
# Need to run only once
/home/appuser/.local/bin/mim download mmaction2 --config tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb --dest .

# Run demo
# The demo.mp4 and label_map_k400.txt are both from Kinetics-400
python demo/demo.py tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb.py \
    tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb_20220906-2692d16c.pth \
    demo/demo.mp4 tools/data/kinetics/label_map_k400.txt
```

