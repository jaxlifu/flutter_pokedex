import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pokedex/main.dart';

class HttpRequest {
  dynamic _parseResponse(http.Response response) {
    final statusCode = response.statusCode;
    final body = response.body;
    final request = response.request;
    logger.d(
      '[url=${request?.url}]'
      '[method=${request?.method}]'
      '[statusCode=$statusCode]'
      '[responseBody=${body.length > 1024 ? '${body.substring(0, 1024)}...' : body}]',
    );
    return jsonDecode(body);
  }

  Future<dynamic> get(String url, {Map<String, String>? headers}) async {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    return _parseResponse(response);
  }

  Future<void> post(String url, dynamic body,
      {Map<String, String>? headers}) async {
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    return _parseResponse(response);
  }
}
