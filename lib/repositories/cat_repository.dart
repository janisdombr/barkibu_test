import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cat_model.dart';

class CatRepository {
  String endpoint = 'https://rsawmit7lbvfka2pwd3xhwouw40fnfpc.lambda-url.eu-central-1.on.aws/';
  String imageUrlPAth = 'https://cataas.com/cat/';
  Future<List<Cat>> getCats() async {
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List;
      return jsonList.map((dynamic json) => Cat.fromJson(json as Map<String, dynamic>)).toList();
    } else {
      throw Exception('Failed to load cat');
    }
  }
}