#!/bin/bash

rm -rf mods/

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

javac -d mods/br.com.casadocodigo \
  --module-path mods \
  src/br.com.casadocodigo/module-info.java \
  $(find src/br.com.casadocodigo -name "*.java")
