import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import 'package:http_interceptor/http/intercepted_client.dart';

import 'my_retry_policy.dart';

class WebContentWidget extends StatelessWidget {
  late http.Client _httpClient;

  WebContentWidget() {
    _httpClient = InterceptedClient.build(
      client: IOClient(HttpClient()),
      interceptors: [],
      retryPolicy: MyRetryPolicy(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<http.Response>(
      future: _getHelloWorld(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(
            snapshot.data?.body ?? "",
            style: TextStyle(fontSize: 25),
          );
        }
        return Container();
      },
    );
  }

  Future<http.Response> _getHelloWorld() {
    return _httpClient.get(
      Uri.parse("https://test-api.service.hmrc.gov.uk/hello/world"),
      headers: {
        "Accept": "application/vnd.hmrc.1.0+json",
      },
    );
  }
}
