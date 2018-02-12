
jlink --module-path /usr/lib/jvm/java-9-oracle/jmods \
 --add-modules java.base,jdk.incubator.httpclient \
 --output small-JRE

### COMPILE ###

javac -d mods/br.com.casadocodigo \
  --module-path mods \
  src/br.com.casadocodigo/module-info.java \
  $(find . -name "*.java")

"*

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

### RUN ###

java --module-path mods -m br.com.casadocodigo/br.com.casadocodigo.Main

##clean

rm -rf mods/
