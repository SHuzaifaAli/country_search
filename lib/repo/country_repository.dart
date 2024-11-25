import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/country.dart';

class CountryRepository {
  Future<List<Country>> fetchCountries(String query) async {
    final url = Uri.parse('https://restcountries.com/v3.1/name/$query');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Country.fromJson(json)).toList();
    } else {
      throw Exception('Unable to fetch data!');
     }
  }
}
