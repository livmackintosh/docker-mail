#!/bin/bash
set -ex
cd $1
export TAG=$(echo $1 | sed s%/$%%)
docker build --tag=$TAG .
