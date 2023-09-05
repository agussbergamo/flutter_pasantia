import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
import '../views/movie_detail.dart';
import 'plain_text.dart';

class MovieListItem extends StatelessWidget {
  const MovieListItem({
    super.key,
    required this.moviesList,
    required this.index,
  });

  final List<Movie> moviesList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(
                  UIConstants.movieImageBorderRadius,
                ),
                child: Image.network(
                  moviesList[index].fullBackdrop,
                  width: UIConstants.moviesListImageSize,
                ),
              ),
              UIConstants.listIconSpace,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    moviesList[index].originalTitle,
                    style: UIConstants.subtitleTextStyle,
                  ),
                  UIConstants.lineSpace,
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: UIConstants.contrastColor,
                      ),
                      UIConstants.listIconSpace,
                      PlainText(
                        text: moviesList[index].voteAverage.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          IconButton.filled(
            onPressed: () {
              Navigator.pushNamed(
                context,
                MovieDetail.routeName,
                arguments: moviesList[index],
              );
            },
            icon: const Icon(
              Icons.chevron_right,
              color: UIConstants.contrastColor,
            ),
          ),
        ],
      ),
      UIConstants.sectionSpace,
    ]);
  }
}
