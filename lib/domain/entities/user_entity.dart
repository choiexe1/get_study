import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  const UserEntity({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
  });

  final int id;
  final String username;
  final String password;
  final String name;

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'password': password, 'name': name};
  }

  @override
  String toString() {
    return 'UserEntity(username: $username, password: $password, name: $name)';
  }
}
