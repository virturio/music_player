import 'package:get_it/get_it.dart';
import 'package:music_player/data/repositories/auth/auth_repository_impl.dart';
import 'package:music_player/data/repositories/song/song_repository_impl.dart';
import 'package:music_player/data/sources/auth/auth_firebase_service.dart';
import 'package:music_player/data/sources/song/song_firebase_service.dart';
import 'package:music_player/domain/repositories/auth.dart';
import 'package:music_player/domain/repositories/song/song.dart';
import 'package:music_player/domain/usecases/auth/get_user_usecase.dart';
import 'package:music_player/domain/usecases/auth/signin_usecase.dart';
import 'package:music_player/domain/usecases/auth/signup_usecase.dart';
import 'package:music_player/domain/usecases/song/get_favorite_song.dart';
import 'package:music_player/domain/usecases/song/get_or_remove_favorite_song_use_case.dart';
import 'package:music_player/domain/usecases/song/get_playlist_usecase.dart';
import 'package:music_player/domain/usecases/song/get_songs_usecase.dart';
import 'package:music_player/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignupUseCase>(SignupUseCase());
  sl.registerSingleton<SigninUseCase>(SigninUseCase());
  sl.registerSingleton<SongFirebaseService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetSongsUseCase>(GetSongsUseCase());
  sl.registerSingleton<GetPlaylistUseCase>(GetPlaylistUseCase());
  sl.registerSingleton<AddOrRemoveFavoriteSongUseCase>(
      AddOrRemoveFavoriteSongUseCase());
  sl.registerSingleton<IsFavoriteSongUseCase>(IsFavoriteSongUseCase());
  sl.registerSingleton<GetUserUseCase>(GetUserUseCase());
  sl.registerSingleton<GetFavoriteSongsUseCase>(GetFavoriteSongsUseCase());
}
