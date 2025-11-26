import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  static const baseUrl = "http://localhost:8000";

  static Future<String> sendMessage({
    required String agentId,
    required String prompt,
  }) async {
    print("agent_id: $agentId , prompt: $prompt");
    try {
      final response = await http.post(
        Uri.parse("$baseUrl/agents/$agentId/execute"),
        headers: {"Content-Type": "application/json"},
        body: json.encode({"message": prompt}),
      );

      if (response.statusCode != 200) {
        print(
          "erro de timeout ou falha do gemini: Status ${response.statusCode} - ${response.body}",
        );
        throw Exception("Erro na API: ${response.statusCode}");
      }

      final data = json.decode(response.body);
      print("Resposta do agent_id ao cliente ${data["response"]}");
      return data["response"];
    } catch (e) {
      print("erro de timeout ou falha do gemini: $e");
      rethrow;
    }
  }
}
