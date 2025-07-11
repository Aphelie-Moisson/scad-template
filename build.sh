#!/usr/bin/env bash

version="\"$(git describe --tags --always --dirty)\""

set_default_values="-D version_tag=${version}"
while read line; do
	name=$(cut -d "=" -f1 <<< $line | tr -d " ")
	default_value=$(cut -d "=" -f2 <<< $line | tr -d " ")
	value=${!name-$default_value}
	set_default_values="${set_default_values} -D ${name}=${value}"
done < default_env.env

mkdir -p ./build

for f in ./src/*.scad; do
	name=$(basename $f .scad)
	if [[ -z "$only" || "$only" == "$name" ]]; then
		echo
		echo -e "\033[32;1m=== Building ${name} ===\033[0m"
		echo "openscad ${set_default_values} -o ./build/${name}.stl ./src/${name}.scad;"
		echo
		openscad ${set_default_values} -o ./build/${name}.stl ./src/${name}.scad;
	fi
done
