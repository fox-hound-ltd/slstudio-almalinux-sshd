# 使用するベースイメージ
FROM almalinux:latest

# 必要なパッケージのインストール
RUN dnf -y install openssh-server sudo && \
  dnf clean all

# SSH接続用のユーザーを作成
RUN useradd -m -s /bin/bash dockeruser && \
  echo "dockeruser:dockeruser" | chpasswd

# dockeruserにsudo権限を与える
RUN echo 'dockeruser ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/dockeruser && \
  chmod 0440 /etc/sudoers.d/dockeruser

# dockeruserの.sshディレクトリを準備
RUN mkdir -p /home/dockeruser/.ssh && \
  chmod 700 /home/dockeruser/.ssh && \
  chown dockeruser:dockeruser /home/dockeruser/.ssh

# SSHデーモンの設定
RUN mkdir /run/sshd

# SSHホストキーを生成
RUN ssh-keygen -A

# 設定ファイルの変更
RUN sed -i 's/^#PermitRootLogin yes/PermitRootLogin yes/' /etc/ssh/sshd_config && \
  sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
  sed -i 's/^#PermitUserEnvironment no/PermitUserEnvironment yes/' /etc/ssh/sshd_config

# SSHで接続するためのポートを開ける
EXPOSE 22

# SSHデーモンを起動
CMD ["/usr/sbin/sshd", "-D"]
