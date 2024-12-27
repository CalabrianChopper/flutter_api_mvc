import 'package:flutter_api_1/model/user_dob.dart';
import 'package:flutter_api_1/model/user_location.dart';
import 'package:flutter_api_1/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDob dob;
  final UserLocation location;
  
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
  });

  String get fullName => '${name.first} ${name.last}';
}
