import 'package:cinemapedia/presentation/provider/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavoritesView extends ConsumerStatefulWidget {
  const FavoritesView({super.key});

  @override
  FavoritesViewState createState() => FavoritesViewState();
}

class FavoritesViewState extends ConsumerState<FavoritesView> {
  @override
  void initState() {
    super.initState();
    loadNextPage();
  }

  void loadNextPage() async {
    final movies =
        await ref.read(favoriteMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final favoriteMovies = ref.watch(favoriteMoviesProvider).values.toList();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favorites'),
        ),
        body:MovieMasonry(movies: favoriteMovies, loadNextPage: loadNextPage));
  }
}
