import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';
import '../models/categories_model.dart';

class CategoryRepository {
  Future<Categories> getAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/cat'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final result = categoriesFromJson(response.body);
      return result;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}

