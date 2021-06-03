#!/bin/bash
#OTEL_JAR=patched-old-otel.jar
#OTEL_CLASS=io.opentelemetry.auto.bootstrap.StaticInstrumenter

OTEL_JAR=opentelemetry-javaagent-all.jar
OTEL_CLASS="io.opentelemetry.javaagent.StaticInstrumenter"
ARTIFACT=websocket-demo-0.0.1-SNAPSHOT.jar
DESTINATION=tmp

#java -Dotel.traces.exporter=logging -Dotel.metrics.exporter=logging -Dota.static.instrumenter=true -javaagent:$OTEL_JAR -cp $OTEL_JAR:websocket-demo.jar OTEL_CLASS ./tmp

mvn package -DskipTests

java -Dota.static.instrumenter=true -Dotel.javaagent.debug=true -javaagent:otel/$OTEL_JAR -cp otel/$OTEL_JAR:target/$ARTIFACT $OTEL_CLASS ./$DESTINATION
printf "\nRUNNING INSTRUMENTED APP \n\n"
java -cp $DESTINATION/$OTEL_JAR -jar $DESTINATION/$ARTIFACT
