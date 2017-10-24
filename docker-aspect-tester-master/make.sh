#!/bin/bash
id="gassmoeller/aspect-tester-master"
echo "building: $id"
docker build -t $id .
