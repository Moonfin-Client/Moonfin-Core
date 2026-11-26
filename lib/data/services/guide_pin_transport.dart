import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

/// Dio's browser adapter uses XMLHttpRequest, which follows redirects automatically.
/// The fetch-backed HTTP client can reject them before resending the pin request.
Future<Response<Map<String, dynamic>>> postBrowserGuidePin(
  RequestOptions options,
) async {
  final client = http.Client();
  try {
    final request = http.Request('POST', options.uri)
      ..followRedirects = false
      ..headers.addAll(options.headers.cast<String, String>())
      ..body = jsonEncode(options.data);
    final reply = await client
        .send(request)
        .then(http.Response.fromStream)
        .timeout(options.receiveTimeout ?? const Duration(seconds: 30));
    final response = Response<Map<String, dynamic>>(
      requestOptions: options,
      statusCode: reply.statusCode,
    );
    if (!options.validateStatus(reply.statusCode)) {
      throw DioException.badResponse(
        statusCode: reply.statusCode,
        requestOptions: options,
        response: response,
      );
    }
    if (reply.bodyBytes.isNotEmpty) {
      response.data = jsonDecode(utf8.decode(reply.bodyBytes)) as Map<String, dynamic>?;
    }
    return response;
  } finally {
    client.close();
  }
}
