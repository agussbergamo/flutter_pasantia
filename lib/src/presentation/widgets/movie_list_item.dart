import 'package:flutter/material.dart';

import '../../core/util/string_constants.dart';
import '../../core/util/ui_constants.dart';
import '../../domain/entity/movie.dart';
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
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              StringConstants.movieDetailRouteName,
              arguments: {
                'movie': moviesList[index],
              },
            );
          },
          child: Row(
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
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      moviesList[index].originalTitle,
                      style: UIConstants.subtitleTextStyle,
                      maxLines: 2,
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
              ),
            ],
          ),
        ),
        UIConstants.sectionSpace,
      ],
    );
  }
}
