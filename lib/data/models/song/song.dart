import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/domain/entities/song/song.dart';

class SongModel {
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String coverImg;

  const SongModel({
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.coverImg,
  });

  static SongModel fromJson(Map<String, dynamic> json) {
    return SongModel(
      title: json['title'],
      artist: json['artist'],
      duration: json['duration'],
      releaseDate: json['releaseDate'],
      coverImg: json['coverImg'],
    );
  }
}

extension SongModelUtil on SongModel {
  bool get foo => false;

  SongEntity toEntity() {
    return SongEntity(
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
      coverImg: coverImg,
    );
  }
}
