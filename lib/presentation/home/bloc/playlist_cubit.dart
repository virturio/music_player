import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music_player/domain/usecases/song/get_playlist_usecase.dart';
import 'package:music_player/presentation/home/bloc/songs_state.dart';
import 'package:music_player/service_locator.dart';

class PlaylistCubit extends Cubit<PlaylistState> {
  PlaylistCubit() : super(PlaylistLoading());

  Future<void> getSongs() async {
    final songsEither = await sl.get<GetPlaylistUseCase>().call();
    songsEither.fold((error) {
      emit(PlaylistLoadFailure(error: error));
    }, (data) {
      emit(PlaylistLoaded(songs: data));
    });
  }
}
