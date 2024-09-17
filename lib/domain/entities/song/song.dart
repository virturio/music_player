import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntity {
  final String id;
  final String title;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final String coverImg;
  final bool isFavorite;

  const SongEntity({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.coverImg,
    this.isFavorite = false,
  });
}
