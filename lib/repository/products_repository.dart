import 'package:grocerygo/constants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/products_model.dart';

class ProductsRepository {
  Future<Products> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    final response = await http.get(
      Uri.parse('$baseUrl/products'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      final result = productsFromJson(response.body);
      return result;
    } else {
      throw "Something went wrong code ${response.statusCode}";
    }
  }
}
