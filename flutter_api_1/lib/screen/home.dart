import 'package:flutter/material.dart';
import 'package:flutter_api_1/model/user.dart';
import 'package:flutter_api_1/services/user_api.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];

  @override
  void initState(){
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 97, 12),
        shadowColor: const Color.fromARGB(255, 29, 222, 193),
        elevation: 10,
        title: const Text(
          'Rest API QMT WOW', 
          style: TextStyle(
            fontSize: 20, 
            color: Color.fromARGB(255, 207, 207, 1)
            )
          ),
      ),

      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          //final email = user.email;
          //final color = user.gender == 'male' ? Colors.blue : Colors.pink;
          return ListTile(
            title: Text(user.fullName),
            subtitle: Text(user.location.postcode),
            //tileColor: color,
          );
        },
      ),
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState((){
      users = response;
    });
  }

}