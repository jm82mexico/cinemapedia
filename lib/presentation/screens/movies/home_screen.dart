import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/views/views.dart';

import 'package:cinemapedia/presentation/widgets/widgets.dart';


class HomeScreen extends StatelessWidget {
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  static const name = 'Home Screen';

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currentIndex:pageIndex ,),

    );
  }
}



