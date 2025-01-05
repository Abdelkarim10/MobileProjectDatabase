import 'dart:convert';
import 'package:http/http.dart' as http;

class QuoteService {
  final String baseUrl = 'http://10.0.2.2:8000/api';


  Future<List<dynamic>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/categories'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      throw Exception('Error fetching categories: $e');
    }
  }


  Future<List<dynamic>> getAuthors() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/authors'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load authors');
      }
    } catch (e) {
      throw Exception('Error fetching authors: $e');
    }
  }


  Future<List<dynamic>> getQuotes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/quotes'));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load quotes');
      }
    } catch (e) {
      throw Exception('Error fetching quotes: $e');
    }
  }


  Future<void> addQuote(String content, int categoryId, int authorId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/quotes'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'content': content,
          'category_id': categoryId,
          'author_id': authorId,
        }),
      );
      if (response.statusCode != 201) {
        throw Exception('Failed to add quote');
      }
    } catch (error) {
      throw Exception('Error adding quote: $error');
    }
  }
}
