

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

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
            IconButton(onPressed: (){}, icon: const Icon(Icons.search))
          ],
        ),
      ),
    );
  }
}

