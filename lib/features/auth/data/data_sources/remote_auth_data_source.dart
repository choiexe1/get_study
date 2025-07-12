import 'package:get/utils.dart';
import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/exceptions/auth_exception.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/features/auth/data/models/user_dto.dart';

const List<UserDto> users = [
  UserDto(id: 1, username: 'jay', password: 'jay', name: 'Jay Choi'),
  UserDto(id: 2, username: 'test', password: 'test', name: 'Tester'),
];

class RemoteAuthDataSource {
  Future<Result<UserDto, BaseException>> login(
    String username,
    String password, {
    String? baseUrl,
  }) async {
    UserDto? user = users.firstWhereOrNull(
      (model) => model.username == username,
    );

    if (user == null) {
      return Failure(AuthException(message: '유저를 찾을 수 없습니다.'));
    }

    if (user.password == password) {
      return Success(user);
    } else {
      return Failure(AuthException(message: '패스워드가 일치하지 않습니다.'));
    }
  }
}
