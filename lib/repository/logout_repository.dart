import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';

class LogoutRepository {
  final SharedPreferences _prefs;

  LogoutRepository(this._prefs);

  Future<void> logout(String token) async {
    final token = _prefs.getString('token');

    try {
      await http.post(
        Uri.parse('$baseUrl/logout'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
    } catch (e) {
      print('Error logging out: $e');
    }

    // Remove preferences from local storage
    await _prefs.remove('token');
    await _prefs.remove('userId');
    await _prefs.remove('name');
    await _prefs.remove('phone');
    await _prefs.remove('email');
  }
}

// import 'package:dio/dio.dart';
//
// class LogoutRepository {
//   final Dio _dio;
//
//   LogoutRepository(this._dio);
//
//   Future<void> logout(String token) async {
//     try {
//       await _dio.post(
//         'http://ainea.com/api/logout',
//         options: Options(
//           headers: {'Authorization': 'Bearer $token'},
//         ),
//       );
//     } catch (e) {
//       // handle error
//       rethrow;
//     }
//   }
// }

