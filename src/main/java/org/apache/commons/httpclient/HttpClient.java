package org.apache.commons.httpclient;

import java.io.IOException;

public class HttpClient {

    public static HttpClient instanceOf() {
        return new HttpClient();
    }

    public int executeMethod(HostConfiguration hostConfiguration, HttpMethod method, HttpState state)  {
        System.out.println("CALLED FAKE HTTP CLIENT! :D");
        return 0;
    }
}
