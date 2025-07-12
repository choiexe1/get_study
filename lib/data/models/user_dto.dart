import 'package:get_study/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  const UserDto({
    required super.id,
    required super.username,
    required super.password,
    required super.name,
  });

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      password: password,
      name: name,
    );
  }
}
