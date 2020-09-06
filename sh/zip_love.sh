#!/bin/bash
path=${PWD}
parentdir="$(basename "$(dirname "$path")")"
cd ../game
zip -r ../love2d/$parentdir.love *