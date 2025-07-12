import 'package:flutter/foundation.dart';

@immutable
class UserEntity {
  const UserEntity({
    required this.id,
    required this.username,
    required this.password,
    required this.name,
  });

  final int? id;
  final String? username;
  final String? password;
  final String? name;

  @override
  String toString() {
    return 'UserEntity(username: $username, password: $password, name: $name)';
  }
}
