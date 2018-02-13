#!/bin/bash

rm -rf mods/
rm -rf JRE-bookstore/
rm -rf mlib/

declare -a modules=("tracking" "domain" "http" "nf" "logging")

for module in "${modules[@]}"
do
  echo "Compiling module $module"
  javac -d mods/br.com.casadocodigo."$module" \
    --module-path mods \
    src/br.com.casadocodigo.$module/module-info.java \
    $(find src/br.com.casadocodigo.$module -name "*.java")
done

javac -d mods/br.com.casadocodigo \
  --module-path mods \
  src/br.com.casadocodigo/module-info.java \
  $(find src/br.com.casadocodigo -name "*.java")

echo "Generating JRE"
jlink --module-path /usr/lib/jvm/java-9-oracle/jmods:mods \
 --add-modules br.com.casadocodigo,br.com.casadocodigo.logging \
 --output JRE-bookstore

 echo "Generating modular jar"
mkdir mlib

packageName=br.com.casadocodigo

jar --create \
  --file=mlib/$packageName.domain-1.0.jar \
  --module-version 1.0 \
  -C mods/$packageName.domain .

jar --create \
  --file=mlib/$packageName.http-1.0.jar \
  --module-version 1.0 \
  -C mods/$packageName.http .

jar --create \
  --file=mlib/$packageName.nf-1.0.jar \
  --module-version 1.0 \
  -C mods/$packageName.nf .

jar --create \
  --file=mlib/$packageName-1.0.jar \
  --module-version 1.0 \
  --main-class=br.com.casadocodigo.Main \
  -C mods/$packageName .
