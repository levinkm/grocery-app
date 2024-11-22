import 'dart:convert';

import '../constants.dart';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class LoginRepository {
  //static const baseUrl = 'http://http.obura.com/api';

  Future<User> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    //print(response.body);
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      //final user = User.fromJson(jsonBody['user']);
      final user = User.fromJson(jsonBody);
      return user;
    } else if (response.statusCode == 401) {
      final errorMessage = json.decode(response.body)['message'];
      throw Exception(errorMessage);
    } else {
      throw Exception('Failed to authenticate user ${response.statusCode}');
    }
    // else {
    //   throw Exception('Failed to authenticate user ${response.statusCode}');
    // }
  }
}