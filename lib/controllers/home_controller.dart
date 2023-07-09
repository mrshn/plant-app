import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/blog.dart';
import '../models/plant.dart';

class HomeController {
  static Future<List<Plant>> fetchPlants() async {
    final url =
        Uri.parse('https://dummy-api-jtg6bessta-ey.a.run.app/getCategories');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body)["data"];

      return List<Plant>.from(
        jsonData.map((plantData) => Plant.fromJson(plantData)),
      );
    } else {
      throw Exception('Failed to fetch plants');
    }
  }

  static Future<List<Blog>> fetchBlogs() async {
    final url =
        Uri.parse('https://dummy-api-jtg6bessta-ey.a.run.app/getQuestions');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      return List<Blog>.from(
        jsonData.map((blogData) => Blog.fromJson(blogData)),
      );
    } else {
      throw Exception('Failed to fetch blogs');
    }
  }
}
