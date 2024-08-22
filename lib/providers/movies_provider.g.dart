// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$nowPlayingNotifierHash() =>
    r'5eabd1de0822f06bb9dc51a4870b454013dcfac2';

/// See also [NowPlayingNotifier].
@ProviderFor(NowPlayingNotifier)
final nowPlayingNotifierProvider =
    AutoDisposeAsyncNotifierProvider<NowPlayingNotifier, NowPlaying?>.internal(
  NowPlayingNotifier.new,
  name: r'nowPlayingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$nowPlayingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NowPlayingNotifier = AutoDisposeAsyncNotifier<NowPlaying?>;
String _$trendingNotifierHash() => r'67ce1e6b1af29b13a2e7686a8783f1e8bf90beea';

/// See also [TrendingNotifier].
@ProviderFor(TrendingNotifier)
final trendingNotifierProvider =
    AutoDisposeAsyncNotifierProvider<TrendingNotifier, Trending?>.internal(
  TrendingNotifier.new,
  name: r'trendingNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trendingNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TrendingNotifier = AutoDisposeAsyncNotifier<Trending?>;
String _$popularSeriesNotifierHash() =>
    r'ea003c59d950dc27887a84d330ad1c43d6bf9afa';

/// See also [PopularSeriesNotifier].
@ProviderFor(PopularSeriesNotifier)
final popularSeriesNotifierProvider = AutoDisposeAsyncNotifierProvider<
    PopularSeriesNotifier, PopularSeries?>.internal(
  PopularSeriesNotifier.new,
  name: r'popularSeriesNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$popularSeriesNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PopularSeriesNotifier = AutoDisposeAsyncNotifier<PopularSeries?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
