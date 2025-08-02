import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_unicode_tasks/data/movie.dart';
import 'package:http/http.dart' as http;

Future<Movie> fetchRandomMovie() async {
  final url = Uri.parse('https://flutterucinterviewtask.onrender.com/random');

  try {
    final response = await http.get(url).timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return Movie.fromJson(jsonBody);
    } else {
      throw HttpException('Failed to load movie. Status code: ${response.statusCode}');
    }
  } on SocketException {
    throw Exception('No Internet connection');
  } on TimeoutException {
    throw Exception('Request timed out');
  } on FormatException {
    throw Exception('Invalid JSON format');
  } catch (e) {
    throw Exception('Unexpected error: $e');
  }
}
