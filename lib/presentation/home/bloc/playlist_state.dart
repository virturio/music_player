import 'package:music_player/domain/entities/song/song.dart';

sealed class SongsState {}

final class SongsLoading extends SongsState {}

final class SongsLoaded extends SongsState {
  SongsLoaded({
    required this.songs,
  });

  final List<SongEntity> songs;
}

final class SongsLoadFailure extends SongsState {
  SongsLoadFailure({
    required this.error,
  });

  final String error;
}
