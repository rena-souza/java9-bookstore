#!/bin/bash

rm -rf mods/
rm -rf JRE-bookstore/
rm -rf mlib/

javac -d mods/br.com.casadocodigo.domain \
  --module-path mods \
  src/br.com.casadocodigo.domain/module-info.java \
  $(find src/br.com.casadocodigo.domain -name "*.java")

javac -d mods/br.com.casadocodigo.http \
  --module-path mods \
  src/br.com.casadocodigo.http/module-info.java \
  $(find src/br.com.casadocodigo.http -name "*.java")

javac -d mods/br.com.casadocodigo.nf \
  --module-path mods \
  src/br.com.casadocodigo.nf/module-info.java \
  $(find src/br.com.casadocodigo.nf -name "*.java")

javac -d mods/br.com.casadocodigo.logging \
  --module-path mods \
  src/br.com.casadocodigo.logging/module-info.java \
  $(find src/br.com.casadocodigo.logging -name "*.java")

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
