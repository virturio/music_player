import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music_player/domain/usecases/song/get_songs_usecase.dart';
import 'package:music_player/presentation/home/bloc/songs_state.dart';
import 'package:music_player/service_locator.dart';

class SongsCubit extends Cubit<PlaylistState> {
  SongsCubit() : super(PlaylistLoading());

  Future<void> getSongs() async {
    final songsEither = await sl.get<GetSongsUseCase>().call();
    songsEither.fold((error) {
      emit(PlaylistLoadFailure(error: error));
    }, (data) {
      emit(PlaylistLoaded(songs: data));
    });
  }
}
