#!/bin/sh

current_dir=`pwd`

target_dir=data

mkdir -p $target_dir
cd $target_dir

wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_admin_0_map_subunits.zip
unzip ne_10m_admin_0_map_subunits.zip
wget http://www.naturalearthdata.com/http//www.naturalearthdata.com/download/10m/cultural/ne_10m_populated_places.zip
unzip ne_10m_populated_places.zip

cd $current_dir

