#!/bin/bash
#OTEL_JAR=patched-old-otel.jar
#OTEL_CLASS=io.opentelemetry.auto.bootstrap.StaticInstrumenter
OTEL_JAR=opentelemetry-javaagent-all.jar
OTEL_CLASS="io.opentelemetry.javaagent.StaticInstrumenter"
#java -Dotel.traces.exporter=logging -Dotel.metrics.exporter=logging -Dota.static.instrumenter=true -javaagent:$OTEL_JAR -cp $OTEL_JAR:websocket-demo.jar OTEL_CLASS ./tmp
java -Dota.static.instrumenter=true -javaagent:otel/$OTEL_JAR -cp otel/$OTEL_JAR:out/artifacts/websocket_demo_jar/websocket-demo.jar $OTEL_CLASS ./tmp
java -cp tmp/$OTEL_JAR -jar tmp/websocket-demo.jar
