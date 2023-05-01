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
bin/dev run -i app /bin/bash
```

Then, run following commands in the running container.

### Run action detection with pre-trained model
```shell
# In the running container

# Download model and code for demo
# Need to run only once
mim download mmaction2 --config tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb --dest .

# Run demo
# The demo.mp4 and label_map_k400.txt are both from Kinetics-400
python demo/demo.py tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb.py \
    tsn_imagenet-pretrained-r50_8xb32-1x1x8-100e_kinetics400-rgb_20220906-2692d16c.pth \
    demo/demo.mp4 tools/data/kinetics/label_map_k400.txt
```

### Train model
Refer: https://mmaction2.readthedocs.io/en/latest/get_started/quick_run.html

Download dataset
```shell
# In the host machine
cd data
wget https://download.openmmlab.com/mmaction/kinetics400_tiny.zip
unzip kinetics400_tiny.zip
```

Start and attach to docker container
```shell
# In the running container

# According to this
# https://mmaction2.readthedocs.io/en/latest/get_started/quick_run.html#browse-the-dataset
python tools/visualizations/browse_dataset.py \
    configs/custom_configs/tsn_imagenet-pretrained-r50_8xb32-1x1x3-100e_kinetics400-rgb_custom.py \
    browse_out --mode pipeline
```