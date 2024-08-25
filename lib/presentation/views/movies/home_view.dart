import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(topRatePlayingMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if(initialLoading){
      return const FullScreenLoader();
    }

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowProvider = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularPlayingMoviesProvider);
    final topRatedMovies = ref.watch(topRatePlayingMoviesProvider);
    final upcomingMovies = ref.watch(upcomingPlayingMoviesProvider);

    return  CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),

        ),
        SliverList(delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              //const CustomAppbar(),
              MoviesSlideshow(movies: slideShowProvider),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Now Playing',
                subtitle: 'Monday 20',
                loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Coming Soon',
                subtitle: 'This Month',
                loadNextPage: () => ref.read(upcomingPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Popular',
                //subtitle: 'Monday 20',
                loadNextPage: () => ref.read(popularPlayingMoviesProvider.notifier).loadNextPage(),
              ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Best Rated',
                subtitle: 'All Time',
                loadNextPage: () => ref.read(topRatePlayingMoviesProvider.notifier).loadNextPage(),
              ),
            ],
          );
        },
          childCount: 1,
        ),
        ),
      ],
    );
  }
}