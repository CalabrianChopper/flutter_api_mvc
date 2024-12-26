import 'package:flutter_api_1/model/user.dart';
import 'package:flutter_api_1/model/user_name.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi{
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final result = json['results'] as List<dynamic>;
    final users = result.map((e){
    final name = UserName(
      title: e['name']['title'],
      first: e['name']['first'], 
      last: e['name']['last'], 
    );  

    return User(
      cell: e['cell'],
      email: e['email'],
      gender: e['gender'],
      nat: e['nat'],
      phone: e['phone'],
      name: name,
    );
    }).toList();
    return users;
  }
}