import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:music_player/domain/entities/song/song.dart';

class SongModel {
  String id;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String coverImg;
  bool isFavorite;

  SongModel({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.coverImg,
    this.isFavorite = false,
  });

  static SongModel fromJson(Map<String, dynamic> json) {
    return SongModel(
      id: "",
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
      id: id,
      title: title,
      artist: artist,
      duration: duration,
      releaseDate: releaseDate,
      coverImg: coverImg,
      isFavorite: isFavorite,
    );
  }
}
