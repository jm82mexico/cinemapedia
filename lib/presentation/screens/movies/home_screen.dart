import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/presentation/provider/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const name = 'Home Screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [
        const CustomAppbar(),
        Expanded(
          child:
          ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
              );
            },),
        ),
      ],
    );
  }
}

