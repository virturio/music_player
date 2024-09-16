import 'package:dartz/dartz.dart';
import 'package:music_player/core/usecase/usecase.dart';
import 'package:music_player/domain/repositories/song/song.dart';
import 'package:music_player/service_locator.dart';

class GetPlaylistUseCase extends UseCase<Either, void> {
  GetPlaylistUseCase({SongRepository? songRepository})
      : _songRepository = songRepository ?? sl.get<SongRepository>();

  final SongRepository _songRepository;

  @override
  Future<Either> call({params}) async {
    return await _songRepository.getPlaylist();
  }
}
