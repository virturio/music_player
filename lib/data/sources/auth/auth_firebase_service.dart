import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:music_player/data/models/auth/create_user_req.dart';
import 'package:music_player/data/models/auth/signin_user_req.dart';
import 'package:music_player/data/models/auth/user.dart';
import 'package:music_player/domain/entities/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest request);
  Future<Either> signup(CreateUserRequest request);

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

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
      final data = await _firebaseAuth.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      _firestore.collection("Users").add({
        "name": request.fullname,
        "email": data.user?.email,
      });

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

  @override
  Future<Either> getUser() async {
    try {
      var user = await _firestore
          .collection('Users')
          .doc(_firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageURL = _firebaseAuth.currentUser?.photoURL ?? '';
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}
