import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/data/models/song/song.dart';
import 'package:music_player/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getSongs();
}

class SongFirebaseServiceImpl extends SongFirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<Either> getSongs() async {
    try {
      final result = await _firestore
          .collection("Songs")
          .orderBy("releaseDate")
          .limit(3)
          .get();

      final List<SongEntity> songs = result.docs.map((doc) {
        final data = doc.data();
        final song = SongModel.fromJson(data);
        return song.toEntity();
      }).toList();

      return Right(songs);
    } on FirebaseException catch (e) {
      return const Left('An error occured, please try again.');
    }
  }
}
