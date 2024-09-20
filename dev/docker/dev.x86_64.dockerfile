FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04
LABEL maintainer="Shaohui@qcraft.ai"

COPY installers/ /tmp/installers/

RUN bash /tmp/installers/install_minimal_environment.sh
RUN bash /tmp/installers/install_developer_tools.sh
RUN bash /tmp/installers/install_training_support.sh
