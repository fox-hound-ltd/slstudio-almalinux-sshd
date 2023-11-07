# Generate Docker Image

1. **Docker イメージのビルド**:

   ```sh
   docker build -t my_sshd_almalinux .
   ```

2. **Docker コンテナの起動**:

   ```sh
   docker run -d -p 2222:22 --name my_sshd_container_almalinux my_sshd_almalinux
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
