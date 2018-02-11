
### COMPILE ###
javac --add-modules jdk.incubator.httpclient \
  src/br/com/casadocodigo/*.java \
  src/br/com/casadocodigo/model/*.java \
  src/br/com/casadocodigo/service/*.java \
  src/br/com/casadocodigo/data/*.java


java --add-modules jdk.incubator.httpclient $(find . -name "*.java")

### RUN ###

java --add-modules jdk.incubator.httpclient \
  -cp src br.com.casadocodigo.Main
