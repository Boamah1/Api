import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yes/models/api_models.dart';

class TodoApi {
  String url = "https://jsonplaceholder.typicode.com/todos/";
  Future<Todos> getdata() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      var data = json.decode(response.body);
      return Todos.fromjson(data);
    } else {
      throw Exception("👧🏿");
    }
  }
}
