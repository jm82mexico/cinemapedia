


import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref){
  final step1 = ref.watch(nowPlayingMoviesProvider).isEmpty;
  final step2 = ref.watch(popularPlayingMoviesProvider).isEmpty;
  final step3 = ref.watch(topRatePlayingMoviesProvider).isEmpty;
  final step4 = ref.watch(upcomingPlayingMoviesProvider).isEmpty;

  if( step1 || step2 || step3 || step4){
    return true;
  }

  return false;
});