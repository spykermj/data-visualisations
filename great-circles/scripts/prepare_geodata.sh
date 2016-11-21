#!/bin/sh

data_dir=data
html_dir=public_html

mkdir -p ${html_dir}

ogr2ogr \
  -f GeoJSON \
  -where "ADM0_A3 IN ('GBR', 'IRL')" \
  ${data_dir}/subunits.json \
  ${data_dir}/ne_10m_admin_0_map_subunits.shp

ogr2ogr \
  -f GeoJSON \
  -where "ISO_A2 = 'GB' AND SCALERANK < 8" \
  ${data_dir}/places.json \
  ${data_dir}/ne_10m_populated_places.shp

topojson \
  -o ${html_dir}/uk.json \
  --id-property SU_A3 \
  --properties name=NAME \
  -- \
  ${data_dir}/subunits.json \
  ${data_dir}/places.json
