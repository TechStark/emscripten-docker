# Emscripten Docker Image

## Description
- Based on Docker image of latest Ubuntu
- Emscripten SDK folder - `/emsdk`

## Installed tools&packages (in latest tag)
- emsdk
- cmake
- ant
- openjdk-8-jdk
- build-essential
- python
- git-core
- curl

## Versioning
The Docker image tag is the same as Emscripten SDK version, e.g. `ttt43ttt/emscripten:1.37.9` contains Emscripten `1.37.9`, `ttt43ttt/emscripten:1.37` contains the latest patch version of Emscripten `1.37`.

## Development
### How to build Docker image from Dockerfile?
`docker build -t TAG_NAME .`
