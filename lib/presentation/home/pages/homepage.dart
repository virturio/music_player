import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:music_player/common/utils/utils.dart';
import 'package:music_player/common/widgets/basic_app_bar.dart';
import 'package:music_player/core/config/assets/app_assets.dart';
import 'package:music_player/core/config/theme/app_colors.dart';
import 'package:music_player/presentation/home/widget/songs_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
        centerTitle: true,
        hideLeading: false,
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 35,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _HomeArtistCard(),
            _HomeTabBar(controller: _tabController),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                const SongsWidget(),
                Container(),
                Container(),
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class _HomeArtistCard extends StatelessWidget {
  const _HomeArtistCard();

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.bottomCenter, children: [
      Align(
        alignment: Alignment.bottomCenter,
        child: SvgPicture.asset(
          AppVectors.homeTopCard,
        ),
      ),
      Align(
        alignment: const Alignment(0.6, -1.0),
        child: Image.asset(
          AppImages.homeArtist,
        ),
      ),
    ]);
  }
}

class _HomeTabBar extends StatelessWidget {
  const _HomeTabBar({required this.controller});

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: controller,
        isScrollable: true,
        labelColor: context.isDarkMode ? Colors.white : Colors.black,
        dividerHeight: 0,
        indicatorColor: AppColors.primary,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 16,
        ),
        tabs: const [
          Tab(
            child: Text("Songs"),
          ),
          Tab(
            child: Text("Videos"),
          ),
          Tab(
            child: Text("Artists"),
          ),
          Tab(
            child: Text("Podcasts"),
          ),
        ]);
  }
}
