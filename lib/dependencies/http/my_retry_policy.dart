import 'dart:io';

import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/retry_policy.dart';

class MyRetryPolicy extends RetryPolicy {
  final url = 'https://www.example.com/';

  @override
  int maxRetryAttempts = 5;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == HttpStatus.ok) {
      return false;
    }

    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
      return false;
    } on SocketException catch (_) {
      return false;
    }
  }
}
