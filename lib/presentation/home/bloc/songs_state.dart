import 'package:music_player/domain/entities/song/song.dart';

sealed class PlaylistState {}

final class PlaylistLoading extends PlaylistState {}

final class PlaylistLoaded extends PlaylistState {
  PlaylistLoaded({
    required this.songs,
  });

  final List<SongEntity> songs;
}

final class PlaylistLoadFailure extends PlaylistState {
  PlaylistLoadFailure({
    required this.error,
  });

  final String error;
}
