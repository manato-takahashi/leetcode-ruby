# 最新のRuby公式イメージを使用
FROM ruby:latest

# 開発に必要な依存関係をインストール
# LeetCodeの問題によっては、追加のライブラリが必要になる場合があります
RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  curl \
  less \
  nano \
  vim \
  && rm -rf /var/lib/apt/lists/*

# ユーザーを作成し、デフォルトユーザーとして設定
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=1000
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && rm -rf /var/lib/apt/lists/*
USER $USERNAME

# ワークスペースディレクトリを設定
WORKDIR /workspace
