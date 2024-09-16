import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:music_player/domain/usecases/song/get_songs_usecase.dart';
import 'package:music_player/presentation/home/bloc/songs_state.dart';
import 'package:music_player/service_locator.dart';

class SongsCubit extends Cubit<SongsState> {
  SongsCubit() : super(SongsLoading());

  Future<void> getSongs() async {
    final songsEither = await sl.get<GetSongsUseCase>().call();
    songsEither.fold((error) {
      emit(SongsLoadFailure(error: error));
    }, (data) {
      emit(SongsLoaded(songs: data));
    });
  }
}
