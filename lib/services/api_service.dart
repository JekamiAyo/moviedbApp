// ignore_for_file: body_might_complete_normally_nullable

import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_movie_app/model/now_playing.dart';
import 'package:http/http.dart' as http;
import '../model/popular_series.dart';
import '../model/trending.dart';

const apiKey = "451e0be0ce505f59ff8de4be42c0812a";
const nowPlayingUrl =
    "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";

const trendingUrl =
    "https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey";

const popularSeriesUrl =
    "https://api.themoviedb.org/3/tv/popular?api_key=$apiKey";

class ApiService {
  Future<NowPlaying?> getNowPlaying() async {
    try {
      final response = await http.get(Uri.parse(nowPlayingUrl));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return NowPlaying.fromJson(jsonBody);
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }

  Future<Trending?> getTrending() async {
    try {
      final response = await http.get(Uri.parse(trendingUrl));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return Trending.fromJson(jsonBody);
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }

  Future<PopularSeries?> getPopularSeries() async {
    try {
      final response = await http.get(Uri.parse(popularSeriesUrl));
      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return PopularSeries.fromJson(jsonBody);
      }
    } catch (e) {
      debugPrint(
        e.toString(),
      );
    }
  }
}
