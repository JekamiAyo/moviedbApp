import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/views/detail%20screens/popular_series_detail_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../model/popular_series.dart';


class PopularSeriesGridScreen extends StatelessWidget {
  final List<Results>? nowPlayingResults;
  const PopularSeriesGridScreen({super.key, this.nowPlayingResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 10, top: 5),
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
        title: Text(
          "Now Playing",
          style: GoogleFonts.roboto(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1.8,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: nowPlayingResults!.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(
                  () => PopularSeriesDetailPage(
                      result: nowPlayingResults![index]),
                );
              },
              child: Column(
                children: [
                  Flexible(
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
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${nowPlayingResults![index].name}",
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
