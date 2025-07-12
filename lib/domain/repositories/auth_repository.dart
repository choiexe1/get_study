import 'package:get_study/core/base_exception.dart';
import 'package:get_study/core/repository.dart';
import 'package:get_study/core/result.dart';
import 'package:get_study/domain/entities/user_entity.dart';

abstract interface class AuthRepository implements Repository<UserEntity> {
  Future<Result<UserEntity, BaseException>> login(
    String username,
    String password,
  );
}
