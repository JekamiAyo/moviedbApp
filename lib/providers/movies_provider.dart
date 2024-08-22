import 'package:flutter_movie_app/model/popular_series.dart';
import 'package:flutter_movie_app/model/trending.dart';
import 'package:flutter_movie_app/services/api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:async';
import '../model/now_playing.dart';

part 'movies_provider.g.dart';

@riverpod
class NowPlayingNotifier extends _$NowPlayingNotifier {
  Timer? _timer;
  final Duration _fetchInterval = const Duration(minutes: 60);
  final nowPlayingApi = ApiService();

  @override
  Future<NowPlaying?> build() async {
    _startPeriodicFetch();
    return await nowPlayingApi.getNowPlaying();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(_fetchInterval, (timer) async {
      final newData = await nowPlayingApi.getNowPlaying();
      state = AsyncValue.data(newData);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}


@riverpod
class TrendingNotifier extends _$TrendingNotifier {
  Timer? _timer;
  final Duration _fetchInterval = const Duration(minutes: 60);
  final nowPlayingApi = ApiService();

  @override
  Future<Trending?> build() async {
    _startPeriodicFetch();
    return await nowPlayingApi.getTrending();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(_fetchInterval, (timer) async {
      final newData = await nowPlayingApi.getTrending();
      state = AsyncValue.data(newData);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}

@riverpod
class PopularSeriesNotifier extends _$PopularSeriesNotifier {
  Timer? _timer;
  final Duration _fetchInterval = const Duration(minutes: 60);
  final nowPlayingApi = ApiService();

  @override
  Future<PopularSeries?> build() async {
    _startPeriodicFetch();
    return await nowPlayingApi.getPopularSeries();
  }

  void _startPeriodicFetch() {
    _timer = Timer.periodic(_fetchInterval, (timer) async {
      final newData = await nowPlayingApi.getPopularSeries();
      state = AsyncValue.data(newData);
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}