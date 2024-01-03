package com.printmanagement.component.http;

import java.io.IOException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandler;
import java.time.Duration;

public class HttpClientWrapper {

    private final HttpClient http;

    public HttpClientWrapper() {
        this.http = HttpClient.newBuilder()
                .connectTimeout(Duration.ofSeconds(5))
                .build();
    }

    public <T> HttpResponse<T> send(final HttpRequest request, final HttpResponse.BodyHandler<T> responseBodyHandler)
            throws IOException, InterruptedException {
        return http.send(request, responseBodyHandler);
    }

    public void sendAsync(final HttpRequest request, final BodyHandler<?> responseBodyHandler) {
        http.sendAsync(request, responseBodyHandler);
    }
}
