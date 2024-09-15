import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest request);
  Future<Either> signup(CreateUserRequest request);
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<Either> signin(SigninUserRequest request) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return const Right('Signin was successful');
    } on FirebaseAuthException catch (e) {
      final String message = switch (e.code) {
        'invalid-email' => "Email or Password did not match",
        'invalid-credential' => "Email or Password did not match",
        _ => ''
      };

      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserRequest request) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      return const Right('Signup was successful');
    } on FirebaseAuthException catch (e) {
      final String message = switch (e.code) {
        'weak-password' => "The password provided is to weak",
        'email-already-in-use' => "Email already exist",
        _ => ''
      };

      return Left(message);
    }
  }
}
