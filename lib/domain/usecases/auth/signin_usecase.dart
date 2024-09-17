import 'package:dartz/dartz.dart';
import 'package:music_player/core/usecase/usecase.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';
import 'package:music_player/domain/repositories/auth.dart';
import 'package:music_player/service_locator.dart';

class SigninUseCase extends UseCase<Either, SigninUserRequest> {
  SigninUseCase({AuthRepository? authRepository})
      : _authRepository = authRepository ?? sl.get<AuthRepository>();

  final AuthRepository _authRepository;

  @override
  Future<Either> call({required SigninUserRequest params}) async {
    return await _authRepository.signin(params);
  }
}
