import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:network_bloc/models/user.dart';

class UserProvider {
  //https://jsonplaceholder.typicode.com/users/

  Future<List<User>> getUser() async {
    final response =
        await http.get("https://jsonplaceholder.typicode.com/users");

    if (response.statusCode == 200) {
      final List<dynamic> userJson = json.decode(response.body);
      return userJson.map((json) => User.fromJson(json)).toList();
    } else {
      throw Exception("Error");
    }
  }
}
