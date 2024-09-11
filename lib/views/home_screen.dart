import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/model/trending.dart';
import 'package:flutter_movie_app/providers/movies_provider.dart';
import 'package:flutter_movie_app/views/detail%20screens/nowplaying_movie_detail_screen.dart';
import 'package:flutter_movie_app/views/detail%20screens/popular_series_detail_page.dart';
import 'package:flutter_movie_app/views/detail%20screens/trending_movie_detail_screen.dart';
import 'package:flutter_movie_app/views/grid%20screens/nowplaying_grid_screen.dart';
import 'package:flutter_movie_app/views/grid%20screens/popular_series_grid_screen.dart';
import 'package:flutter_movie_app/views/grid%20screens/trending_grid_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import '../widgets/appbar_action_widget.dart';
import '../widgets/appbar_leading_widget.dart';
import '../widgets/shimmer_container.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final heightScreen = MediaQuery.of(context).size.height;
    final nowPlaying = ref.watch(nowPlayingNotifierProvider);
    final trending = ref.watch(trendingNotifierProvider);
    final popularSeries = ref.watch(popularSeriesNotifierProvider);
    late int movieIndex;
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.black,
            onStretchTrigger: () async {
              //ref.read(nowPlayingNotifierProvider.future);
            },
            elevation: 0,
            scrolledUnderElevation: 0,
            pinned: true,
            leadingWidth: 75,
            leading: const AppbarLeadingWidget(),
            actions: const [
              AppbarActionWidget(),
            ],
            expandedHeight: heightScreen * 0.63,
            flexibleSpace: FlexibleSpaceBar(
              // collapseMode: CollapseMode.pin,
              background: Stack(
                children: [
                  SizedBox(
                    height: heightScreen * 0.65,
                    child: nowPlaying.when(
                      data: (data) {
                        final nowPlayingResults = data!.results;
                        return Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: nowPlayingResults!.length,
                              unlimitedMode: true,
                              autoSliderTransitionTime:
                                  const Duration(seconds: 2),
                              autoSliderDelay: const Duration(seconds: 4),
                              enableAutoSlider: true,
                              slideBuilder: (index) {
                                movieIndex = index;
                                return CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w500${nowPlayingResults[index].posterPath ?? nowPlayingResults[index].backdropPath}',
                                  fit: BoxFit.cover,
                                );
                              },
                              slideTransform:
                                  const BackgroundToForegroundTransform(),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  stops: [0.0, 0.9],
                                  colors: [Colors.transparent, Colors.black],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 10,
                              right: 10,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        backgroundColor:
                                            const Color(0xff555555),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.play_arrow_rounded,
                                            color: Colors.white,
                                          ),
                                          Text(
                                            'Play',
                                            style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  SizedBox(
                                    width: 100,
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        side: const BorderSide(
                                            color: Colors.white),
                                      ),
                                      onPressed: () {
                                        Get.to(
                                          () => NowPlayingMovieDetailPage(
                                              result: nowPlayingResults[
                                                  movieIndex]),
                                        );
                                      },
                                      child: Text(
                                        'Details',
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      error: ((error, stackTrace) =>
                          Center(child: Text('Error: $error'))),
                      loading: () => const NullLoadingUI(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  //now playing

                  SizedBox(
                    height: 250,
                    child: nowPlaying.when(
                      data: (data) {
                        final nowPlayingResults = data!.results;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Now Playing",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 26),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                      () => NowPlayingGridScreen(
                                        nowPlayingResults: nowPlayingResults,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "See all",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => NowPlayingMovieDetailPage(
                                            result: nowPlayingResults[index]),
                                      );
                                    },
                                    child: Container(
                                      width: 140,
                                      margin: const EdgeInsets.only(right: 7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${nowPlayingResults![index].posterPath}',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: ((error, stackTrace) =>
                          Center(child: Text('Error: $error'))),
                      loading: () {
                        return const ShimmerContainer();
                      },
                    ),
                  ),

                  const SizedBox(height: 10),

                  //trending
                  SizedBox(
                    height: 250,
                    child: trending.when(
                      data: (data) {
                        final trendingResults = data!.results;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Trending",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 26),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                      () => TrendingGridScreen(
                                        nowPlayingResults: trendingResults,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "See all",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return MovieContainer(
                                      results: trendingResults![index]);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: ((error, stackTrace) =>
                          Center(child: Text('Error: $error'))),
                      loading: () {
                        return const ShimmerContainer();
                      },
                    ),
                  ),

                  const SizedBox(height: 10),
                  //Popular Series
                  SizedBox(
                    height: 250,
                    child: popularSeries.when(
                      data: (data) {
                        final popularSeriesResults = data!.results;
                        return Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Popular Series",
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 26),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(
                                      () => PopularSeriesGridScreen(
                                        nowPlayingResults: popularSeriesResults,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "See all",
                                    style: GoogleFonts.roboto(
                                      color: Colors.grey,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: 6,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(
                                        () => PopularSeriesDetailPage(
                                            result:
                                                popularSeriesResults[index]),
                                      );
                                    },
                                    child: Container(
                                      width: 140,
                                      margin: const EdgeInsets.only(right: 7),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(color: Colors.white),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w500${popularSeriesResults![index].posterPath}',
                                          fit: BoxFit.cover,
                                          // placeholder: (context, url) =>
                                          //     const ShimmerContainer(),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      error: ((error, stackTrace) =>
                          Center(child: Text('Error: $error'))),
                      loading: () {
                        return const ShimmerContainer();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NullLoadingUI extends StatelessWidget {
  const NullLoadingUI({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.9],
              colors: [Colors.transparent, Colors.black],
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff555555),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'Play',
                        style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 100,
                child: TextButton(
                  style: TextButton.styleFrom(
                    side: const BorderSide(color: Colors.white),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Details',
                    style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieContainer extends StatelessWidget {
  const MovieContainer({
    super.key,
    required this.results,
  });

  final Results? results;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => TrendingMovieDetailPage(result: results!),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.white),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${results!.posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
