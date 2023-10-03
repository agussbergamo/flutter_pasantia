import 'package:flutter/material.dart';

import '../../core/util/string_constants.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import 'movie_list_header.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Icons.chevron_left,
              color: UIConstants.contrastColor,
            ),
            MovieListHeader(
              title: movie.title,
            ),
            const Icon(
              Icons.chevron_right,
              color: UIConstants.contrastColor,
            ),
          ],
        ),
        UIConstants.lineSpace,
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                StringConstants.movieDetailRouteName,
                arguments: {
                  'movie': movie,
                },
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                UIConstants.movieImageBorderRadius,
              ),
              child: Image(
                image: NetworkImage(
                  movie.fullPoster,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
