import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class SearchMovieDelegate extends SearchDelegate {

  @override
  String get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      FadeIn(
        animate: query.isNotEmpty,
        duration: const Duration(milliseconds: 250),
        child: IconButton(
            onPressed: () => query = '',
            icon: const Icon(Icons.clear_rounded),
      ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context,null),
        icon:const Icon(Icons.arrow_back_ios_new)
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Text('buildSuggestions');
  }
}
