import 'dart:convert';

import 'package:http/http.dart' as http;

import '../constants.dart';
import '../models/user_model.dart';

class SignUpRepository {
  Future<User> signUp(String name, String phone, String email, String password, String passwordConfirmation) async {
    final url = Uri.parse('$baseUrl/register');

    final response = await http.post(
      url,
      body: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'password confirmation': passwordConfirmation,
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return User.fromJson(data);
    } else {
      throw Exception('Failed to sign up ${response.statusCode}');
    }
  }
}