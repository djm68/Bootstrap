#!/bin/bash

# This script runs on pluto
# Will scp latest tar balls to tb-driver for PE testing

old=`ssh tb-driver "cat /opt/enterprise/dists/LATEST"`
ver=`cat /opt/enterprise/dists/LATEST`

if [ $ver = $old ]; then
  echo "Latest PE tarballs already on tb-driver"
  exit 0
else
  files=`find /opt/enterprise/dists | grep ${ver}`
  for f in $files; do
    if echo $f | grep all ; then
       echo "skipping $f"
    else
      echo $f
      scp $f tb-driver:/opt/enterprise/dists/
    fi
  done
fi

scp /opt/enterprise/dists/LATEST tb-driver:/opt/enterprise/dists/
