import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/data/data_sources/remote_auth_data_source.dart';
import 'package:get_study/domain/entities/user_entity.dart';
import 'package:get_study/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._authDataSource);

  final RemoteAuthDataSource _authDataSource;

  @override
  Future<Result<UserEntity, BaseException>> login(
    String username,
    String password,
  ) async {
    return _authDataSource.login(username, password);
  }
}
