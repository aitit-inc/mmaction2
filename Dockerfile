FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo

RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:jonathonf/ffmpeg-4 && \
    apt-get install -y ffmpeg

RUN apt-get install -y git gcc g++ make

# Create a non-root user and set permissions
RUN useradd --create-home appuser
WORKDIR /home/appuser
RUN chown appuser:appuser /home/appuser
USER appuser

# According to this installation doc of MMAction2
# https://mmaction2.readthedocs.io/en/latest/get_started/installation.html

# Step 1
RUN pip install -U pip wheel
RUN pip install torchvision
RUN pip install -U openmim
RUN pip install mmengine mmcv mmdet mmpose

# Step 2
COPY --chown=appuser:appuser ./mmaction2 /home/appuser/mmaction2
WORKDIR /home/appuser/mmaction2
RUN pip install -v -e .

# Extra packages
COPY --chown=appuser:appuser ./requirements.txt /home/appuser/
WORKDIR /home/appuser
RUN pip install -r requirements.txt

ENV PATH $PATH:/home/appuser/.local/bin
WORKDIR /home/appuser/mmaction2
