# Build ENV for open-broadcaster

Why does this exists?

I needed a build env for OBS and didn't want to install all these dev dependencies on my normal system again. And what better way to learn some more docker.

## How to use

Is anyone really going to use this other then me?  
In that case, I've made it relatively simple; just run the container. It'll automaticly build both FFMPEG and OBS from the latest source.

Example command:

```
docker run -it --rm -v $(pwd)/out:/output leviv/obsbuild
```

After it completes there will be two deb files in the out folder. You can install them with `dpkg -i <file.deb>`.