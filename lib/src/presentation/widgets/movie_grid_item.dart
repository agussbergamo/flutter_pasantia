import 'package:flutter/material.dart';

import '../../core/util/string_constants.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';

class MovieGridItem extends StatelessWidget {
  const MovieGridItem({
    super.key,
    required this.moviesList,
    required this.index,
  });

  final List<Movie> moviesList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          StringConstants.movieDetailRouteName,
          arguments: {
            'movie': moviesList[index],
          },
        );
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              UIConstants.movieImageBorderRadius,
            ),
            child: Image.network(
              moviesList[index].fullBackdrop,
            ),
          ),
          UIConstants.lineSpace,
          Text(
            moviesList[index].originalTitle,
            style: UIConstants.subtitleTextStyle,
          ),
        ],
      ),
    );
  }
}
