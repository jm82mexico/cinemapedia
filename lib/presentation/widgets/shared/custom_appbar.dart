

import 'package:cinemapedia/presentation/delegates/search_movie_delegate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../provider/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Icon(Icons.movie_creation_outlined, color: colors.primary,),
            const SizedBox(width: 5),
            Text('Cinemapedia', style: titleStyle,),
            const Spacer(),
            IconButton(onPressed: (){
              final movieRepository = ref.read(movieRepositoryProvider);
              showSearch(context: context, delegate: SearchMovieDelegate(
                //Send only the reference to the searchMovies method
                searchMovie: movieRepository.searchMovies
              ));
            }, icon: const Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}

