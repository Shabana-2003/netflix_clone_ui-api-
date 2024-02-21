import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  // Existing code...

  static const _postUrl = "https://example.com/post"; // Example URL for POST request

  Future<void> postData(Map<String, dynamic> data) async {
    
    final response = await http.post(
      Uri.parse(_postUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 201) {
      print('Data posted successfully');
    } else {
      throw Exception('Failed to post data');
    }
  }

  static const _putUrl = "https://example.com/put"; // Example URL for PUT request

  Future<void> putData(String id, Map<String, dynamic> data) async {
    final response = await http.put(
      Uri.parse('$_putUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('Data updated successfully');
    } else {
      throw Exception('Failed to update data');
    }
  }

  static const _deleteUrl = "https://example.com/delete"; // Example URL for DELETE request

  Future<void> deleteData(String id) async {
    final response = await http.delete(
      Uri.parse('$_deleteUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      print('Data deleted successfully');
    } else {
      throw Exception('Failed to delete data');
    }
  }
}
