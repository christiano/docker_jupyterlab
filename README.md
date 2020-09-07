# Docker for Jupyterlab

Create the container like:

```
[docker|podman] run -it --rm --name chrjupyter -p 8888:8888 \
    -v /local/path:/devel -w /devel pythonchr:latest
```

