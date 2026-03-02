### Build the Tarball
```bash
nix build .#nixosConfigurations.devcontainer.config.system.build.tarball
```

### Import the Tarball
```bash
docker import \
  --change 'ENTRYPOINT ["/init"]' \
  result/tarball/nixos-system-x86_64-linux.tar.xz \
  nixos-devcontainer:latest
```

### Run the Container
```bash
docker run -d \
  --name nixos-devcontainer \
  --privileged \
  --cap-add=SYS_ADMIN \
  --security-opt=seccomp=unconfined \
  -v /sys/fs/cgroup:/sys/fs/cgroup:rw \
  -v nixos-devcontainer-docker-data:/var/lib/docker \
  nixos-devcontainer:latest
```

### Connect to the Container
```bash
docker exec -it nixos-devcontainer su - code
```