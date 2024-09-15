import 'package:dartz/dartz.dart';
import 'package:music_player/core/usecase/usecase.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/domain/repositories/auth.dart';
import 'package:music_player/service_locator.dart';

class SignupUseCase extends UseCase<Either, CreateUserRequest> {
  SignupUseCase({AuthRepository? authRepository})
      : _authRepository = authRepository ?? sl.get<AuthRepository>();

  final AuthRepository _authRepository;

  @override
  Future<Either> call({required CreateUserRequest params}) async {
    return await _authRepository.signup(params);
  }
}
