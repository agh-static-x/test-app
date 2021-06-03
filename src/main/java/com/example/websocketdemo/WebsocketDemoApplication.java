package com.example.websocketdemo;

import io.opentelemetry.api.trace.propagation.W3CTraceContextPropagator;
import io.opentelemetry.context.propagation.ContextPropagators;
import io.opentelemetry.exporter.zipkin.ZipkinSpanExporter;
import io.opentelemetry.sdk.OpenTelemetrySdk;
import io.opentelemetry.sdk.trace.SdkTracerProvider;
import io.opentelemetry.sdk.trace.export.BatchSpanProcessor;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class WebsocketDemoApplication {

	public static void main(String[] args) {

		configureOtel();
		SpringApplication.run(WebsocketDemoApplication.class, args);
	}

	private static void configureOtel() {

		ZipkinSpanExporter exporter = ZipkinSpanExporter.builder().setEndpoint("http://localhost:8888").build();

		SdkTracerProvider sdkTracerProvider = SdkTracerProvider.builder()
				.addSpanProcessor(BatchSpanProcessor.builder(exporter).build())
				.build();

		OpenTelemetrySdk.builder()
				.setTracerProvider(sdkTracerProvider)
				.setPropagators(ContextPropagators.create(W3CTraceContextPropagator.getInstance()))
				.buildAndRegisterGlobal();

		System.out.println("OTEL CONFIGURED");
	}
}
