# SL スタジオ AlmaLinux sshd

## 使用方法

1. **Docker イメージの取得**:

   ```sh
   docker pull ghcr.io/fox-hound-ltd/slstudio-almalinux-sshd:main
   ```

2. **Docker コンテナの起動**:

   ```sh
   docker run -d -p 2222:22 --name my_sshd_container_almalinux ghcr.io/fox-hound-ltd/slstudio-almalinux-sshd:main
   ```

3. **SSH 接続のテスト**:

   ```sh
   ssh dockeruser@localhost -p 2222
   ```

   パスワードは `dockeruser` です。

4. **Docker コンテナの停止**:

   ```sh
    docker stop my_sshd_container_almalinux
   ```

5. **Docker コンテナの削除**:
   ```sh
    docker rm my_sshd_container_almalinux
   ```
