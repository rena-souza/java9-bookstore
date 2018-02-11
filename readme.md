
### COMPILE ###

javac -d mods/br.com.casadocodigo \
  --module-path mods \
  src/br.com.casadocodigo/module-info.java \
  $(find . -name "*.java")

"*

### RUN ###

java --module-path mods -m br.com.casadocodigo/br.com.casadocodigo.Main
