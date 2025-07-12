import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/core/use_case.dart';
import 'package:get_study/domain/repositories/auth_repository.dart';
import 'package:get_study/domain/entities/user_entity.dart';

class LoginUseCase
    implements
        UseCase<
          Future<Result<UserEntity, BaseException>>,
          ({String username, String password})
        > {
  const LoginUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  Future<Result<UserEntity, BaseException>> call(
    ({String username, String password}) params,
  ) async {
    return _authRepository.login(params.username, params.password);
  }
}
