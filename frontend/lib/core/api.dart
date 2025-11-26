import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://localhost:8000";

  static Future<String> sendMessage({
    required String agentId,
    required String prompt,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/execute"),
      headers: {"Content-Type": "application/json"},
      body: json.encode({"agent_id": agentId, "prompt": prompt}),
    );

    final data = json.decode(response.body);
    return data["response"];
  }
}
