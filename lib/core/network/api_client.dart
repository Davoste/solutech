import 'package:http/http.dart' as http;
import 'dart:convert';
import '../constants/api_constants.dart';

class ApiClient {
  final http.Client client;
  ApiClient(this.client);

  Future<dynamic> get(String endpoint) async {
    final response = await client.get(
      Uri.parse('$BASE_URL$endpoint'),
      headers: {'apikey': API_KEY},
    );
    return _handleResponse(response);
  }

  Future<dynamic> post(String endpoint, Map<String, dynamic> data) async {
    final response = await client.post(
      Uri.parse('$BASE_URL$endpoint'),
      headers: {'apikey': API_KEY, 'Content-Type': 'application/json'},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  dynamic _handleResponse(http.Response response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('API Error: ${response.statusCode}');
    }
  }
}
