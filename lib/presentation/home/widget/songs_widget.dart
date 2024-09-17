import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/core/config/theme/app_colors.dart';
import 'package:music_player/presentation/home/bloc/songs_cubit.dart';
import 'package:music_player/presentation/home/bloc/songs_state.dart';

class SongsWidget extends StatelessWidget {
  const SongsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SongsCubit()..getSongs(),
      child: BlocBuilder<SongsCubit, PlaylistState>(
        builder: (context, state) {
          return switch (state) {
            PlaylistLoading() =>
              const Center(child: CircularProgressIndicator()),
            PlaylistLoadFailure() => Center(child: Text(state.error)),
            PlaylistLoaded() => SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (_, i) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final int lastIndex = state.songs.length - 1;

                    EdgeInsetsGeometry? padding;
                    if (index == lastIndex) {
                      padding = const EdgeInsets.only(right: 16);
                    } else if (index == 0) {
                      padding = const EdgeInsets.only(left: 16);
                    }

                    return Container(
                      padding: padding,
                      height: 140,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  fit: BoxFit.none,
                                  image: NetworkImage(
                                    state.songs[index].coverImg,
                                  ),
                                ),
                              ),
                              child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    transform:
                                        Matrix4.translationValues(10, 10, 0),
                                    decoration: BoxDecoration(
                                      color: context.isDarkMode
                                          ? AppColors.darkGrey
                                          : const Color(0xffe6e6e6),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.play_arrow_rounded,
                                      color: context.isDarkMode
                                          ? const Color(0xff959595)
                                          : const Color(0xff555555),
                                    ),
                                  )),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.songs[index].title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            state.songs[index].title,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: state.songs.length,
                ),
              ),
          };
        },
      ),
    );
  }
}
