import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref){
  //
  final movieRepository = ref.watch(movieRepositoryProvider);
  return MovieMapNotifier(getMovie: movieRepository.getMovieById);
  
});

typedef GetMoviesCallBack = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final GetMoviesCallBack getMovie;

  //mapping initial state is an empty map
  MovieMapNotifier({required this.getMovie}) : super({});

  Future<void> loadMovie(String movieId) async{
    //create local cache to avoid unnecessary api calls
    if(state[movieId] != null) return;
    final movie = await getMovie(movieId);
    //update state with new movie
    state = {...state, movieId: movie};
  }

}
