import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/common/bloc/favorite_button/favorite_button_cubit.dart';
import 'package:music_player/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:music_player/core/config/theme/app_colors.dart';
import 'package:music_player/domain/entities/song/song.dart';

class FavoriteButton extends StatelessWidget {
  final SongEntity songEntity;
  final Function? function;
  const FavoriteButton({required this.songEntity, this.function, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteButtonCubit(),
      child: BlocBuilder<FavoriteButtonCubit, FavoriteButtonState>(
        builder: (context, state) {
          if (state is FavoriteButtonInitial) {
            return IconButton(
                onPressed: () async {
                  await context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.id);
                  if (function != null) {
                    function!();
                  }
                },
                icon: Icon(
                  songEntity.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                ));
          }

          if (state is FavoriteButtonUpdated) {
            return IconButton(
                onPressed: () {
                  context
                      .read<FavoriteButtonCubit>()
                      .favoriteButtonUpdated(songEntity.id);
                },
                icon: Icon(
                  state.isFavorite
                      ? Icons.favorite
                      : Icons.favorite_outline_outlined,
                  size: 25,
                  color: AppColors.darkGrey,
                ));
          }

          return Container();
        },
      ),
    );
  }
}
