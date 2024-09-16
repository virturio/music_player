import 'package:music_player/domain/entities/user.dart';

class UserModel {
  final String fullname;
  final String email;
  String imageURL;

  UserModel({
    required this.fullname,
    required this.email,
    this.imageURL = '',
  });

  static UserModel fromJson(Map<String, dynamic> data) {
    return UserModel(
      fullname: data['name'],
      email: data['email'],
    );
  }
}

extension UserModelX on UserModel {
  UserEntity toEntity() {
    return UserEntity(
      email: email,
      fullname: fullname,
      imageURL: imageURL,
    );
  }
}
