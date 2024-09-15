import 'package:dartz/dartz.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';

abstract class AuthRepository {
  Future<Either> signin(SigninUserRequest request);
  Future<Either> signup(CreateUserRequest request);
}
