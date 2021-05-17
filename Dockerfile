#############################################
# BUILDER IMAGE: Only for building the code #
#############################################
FROM python:3.8-slim-buster AS builder

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y \
    gcc \
    git \
    libldap2-dev \
    libsasl2-dev \
    libssl-dev \
    python3-dev

# Create user for building and installing pip packages inside its home for security purposes
RUN useradd --create-home enterprisebuilder
ENV BUILDER_HOME=/home/enterprisebuilder
WORKDIR $BUILDER_HOME
USER enterprisebuilder

# Install dependencies and create layer cache of them
COPY requirements.txt .
RUN pip install --user -r requirements.txt

######################################
# RUNNER IMAGE: For running the code #
######################################
FROM python:3.8-slim-buster

# Install here only runtime required packages
RUN apt-get update && apt-get install -y \
    gettext \
    libproj-dev

RUN groupadd -g 2000 enterprise && \
    useradd -u 2000 -g enterprise --create-home enterprise

ENV USER_HOME=/home/enterprise
WORKDIR $USER_HOME
USER enterprise

# Copy pip install results from builder image
COPY --from=builder --chown=enterprise /home/enterprisebuilder/.local $USER_HOME/.local

# Make sure scripts installed by pip in .local are usable:
ENV PATH=$USER_HOME/.local/bin:$PATH

COPY --chown=enterprise enterprise/ enterprise/
COPY --chown=enterprise frontend/ frontend/
COPY --chown=enterprise manage.py manage.py
COPY --chown=enterprise scripts/ scripts/
