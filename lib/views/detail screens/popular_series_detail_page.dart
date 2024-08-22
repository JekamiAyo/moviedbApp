import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_movie_app/model/popular_series.dart';
import 'package:flutter_movie_app/views/detail%20screens/trending_movie_detail_screen.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

class PopularSeriesDetailPage extends StatelessWidget {
  final Results result;
  const PopularSeriesDetailPage({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    final heightScreen = MediaQuery.of(context).size.height;
    final widthScreen = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.black,
              onStretchTrigger: () async {},
              elevation: 0,
              scrolledUnderElevation: 0,
              pinned: true,
              leadingWidth: 75,
              leading: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, bottom: 10, top: 5),
                  child: Container(
                    width: 56,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.7),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.6), width: 0.5)),
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 16.0, bottom: 10, top: 5),
                  child: Container(
                    width: 56,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.7),
                        border: Border.all(
                            color: Colors.white.withOpacity(0.6), width: 0.5)),
                    child: const Center(
                      child: Icon(
                        Icons.more_horiz_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                )
              ],
              expandedHeight: heightScreen * 0.35,
              flexibleSpace: FlexibleSpaceBar(
                // collapseMode: CollapseMode.pin,
                background: Stack(
                  children: [
                    SizedBox(
                      height: heightScreen * 0.34,
                      width: widthScreen,
                      child: CachedNetworkImage(
                        imageUrl:
                            'https://image.tmdb.org/t/p/w500${result.backdropPath}',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: SizedBox(
                        width: 100,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Preview',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              "${result.name}",
                              style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.cloud_download_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       
                        MovieDetailTxt(txt: "Air Date: ${result.firstAirDate}"),
                        MovieDetailTxt(
                            txt:
                                "Lang: ${result.originalLanguage!.toUpperCase()}"),
                        result.adult == true
                            ? const MovieDetailTxt(txt: "18+: Yes")
                            : const MovieDetailTxt(txt: "18+: No"),
                        Text.rich(
                          TextSpan(
                            text: "Popularity:",
                            children: [
                              TextSpan(
                                text:
                                    " ${result.popularity!.toStringAsFixed(0)}",
                                style: GoogleFonts.roboto(
                                  color: const Color.fromARGB(255, 108, 229, 56),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        MovieDetailTxt(txt: "Votes: ${result.voteCount}"),
                        Text.rich(
                          TextSpan(
                            text: "Avg Votes:",
                            children: [
                              TextSpan(
                                text:
                                    " ${result.voteAverage!.roundToDouble().toStringAsFixed(0)}",
                                style: GoogleFonts.roboto(
                                  color: const Color(0xffCE4834),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          style: GoogleFonts.roboto(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
                        width: widthScreen,
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
                                size: 20,
                              ),
                              const SizedBox(width: 2),
                              Text(
                                'Play',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "Overview",
                      style: GoogleFonts.roboto(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${result.overview}",
                      style: GoogleFonts.roboto(
                        color: Colors.grey,
                        fontSize: 15,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
