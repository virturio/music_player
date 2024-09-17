import 'package:dartz/dartz.dart';
import 'package:music_player/core/usecase/usecase.dart';
import 'package:music_player/domain/repositories/song/song.dart';

import '../../../service_locator.dart';

class GetFavoriteSongsUseCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<SongRepository>().getUserFavoriteSongs();
  }
}
