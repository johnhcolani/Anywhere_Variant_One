import 'dart:convert';

import 'package:http/http.dart' as http;


// 'http://api.duckduckgo.com/?q=simpsons+characters&format=json',
class SimpsonApiService {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(
      Uri.parse('http://api.duckduckgo.com/?q=simpsons+characters&format=json'), // Replace with the correct API URL
    );

    if (response.statusCode == 200) {
      final parsedResponse = jsonDecode(response.body);
      if (parsedResponse['RelatedTopics'] != null) {
        return parsedResponse['RelatedTopics'];
      } else {
        print('Failed to parse data');
        return [];
      }
    } else {
      print('Failed to load data');
      return [];
    }
  }
}