import 'dart:convert';

import 'package:artriapp/models/index.dart';
import 'package:artriapp/utils/enums/index.dart';
import 'package:artriapp/utils/index.dart';
import 'package:artriapp/utils/index.dart';
import 'package:artriapp/services/index.dart';
import 'package:http/http.dart' as http;

class UserDiaryService {
  final String _baseUrl = Environment.apiUrl;
  final SecurityTokenService _tokenService = SecurityTokenService();

  // Future<List<int>> getFatigueLevels() async {
  //   final response = await http.get(Uri.parse('$_baseUrl/fatigue-levels'));
  //
  //   return List<int>.from(
  //     jsonDecode(response.body),
  //   );
  // }
  //
  // Future<void> addFatigueLevel(int level) async {
  //   final response = await http.post(
  //     Uri.parse('$_baseUrl/fatigue-levels/'),
  //     body: {
  //       'level': level.toString(),
  //       'date': DateTime.now().toIso8601String(),
  //     },
  //   );
  //
  //   if (response.statusCode != 201) {
  //     // No Django REST, 201 significa "Created"
  //     throw Exception('Erro ao salvar nível de fadiga');
  //   }
  // }

  Future<List<int>> getPainLevels() async {
    final String? token = await _tokenService.getToken(SecurityToken.accessToken);

    final response = await http.get(
      Uri.parse('$_baseUrl/daily-pain-reports/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((item) => item['pain_level'] as int).toList();
    }

    throw Exception('Erro ao buscar níveis de dor');
  }

  Future<void> addPainLevel(String bodyOption, int level) async {
    final String? token = await _tokenService.getToken(SecurityToken.accessToken);

    final response = await http.post(
      Uri.parse('$_baseUrl/daily-pain-reports/'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'date': DateTime.now().toIso8601String().split('T')[0], // Formato AAAA-MM-DD
        'pain_level': level,
        'pain_location': bodyOption,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Erro ao salvar nível de dor: ${response.body}');
    }
  }
}