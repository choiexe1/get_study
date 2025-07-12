import 'package:get_study/features/auth/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  const UserDto({super.id, super.username, super.password, super.name});

  UserEntity toEntity() {
    return UserEntity(
      id: id,
      username: username,
      password: password,
      name: name,
    );
  }
}
