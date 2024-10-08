import 'package:dartz/dartz.dart';
import 'package:music_player/data/sources/song/song_firebase_service.dart';
import 'package:music_player/domain/repositories/song/song.dart';
import 'package:music_player/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  SongRepositoryImpl({SongFirebaseService? songService})
      : _songService = songService ?? sl.get<SongFirebaseService>();

  final SongFirebaseService _songService;

  @override
  Future<Either> getSongs() async {
    return await _songService.getSongs();
  }

  @override
  Future<Either> getPlaylist() async {
    return await _songService.getPlaylist();
  }

  @override
  Future<Either> addOrRemoveFavoriteSongs(String songId) async {
    return await sl<SongFirebaseService>().addOrRemoveFavoriteSong(songId);
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    return await sl<SongFirebaseService>().isFavoriteSong(songId);
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    return await sl<SongFirebaseService>().getUserFavoriteSongs();
  }
}
