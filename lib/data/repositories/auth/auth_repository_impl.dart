import 'package:dartz/dartz.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/data/sources/auth/auth_firebase_service.dart';
import 'package:music_player/domain/repositories/auth.dart';
import 'package:music_player/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  AuthRepositoryImpl({AuthFirebaseService? authService})
      : _authService = authService ?? sl.get<AuthFirebaseService>();

  final AuthFirebaseService _authService;

  @override
  Future<void> signin() async {
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserRequest request) async {
    return await _authService.signup(request);
  }
}
