import 'package:get_study/features/auth/domain/entities/user_entity.dart';

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
