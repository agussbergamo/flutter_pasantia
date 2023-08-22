import 'package:flutter/material.dart';

import 'detail_rich_text.dart';
import 'ui_constants.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.originalTitleText,
    required this.dateText,
    required this.voteText,
    required this.genresText,
  });

  final String originalTitleText;
  final String dateText;
  final String voteText;
  final String genresText;
  static const String originalTitle = 'Original title: ';
  static const String date = 'Release date: ';
  static const String vote = 'Vote average: ';
  static const String genres = 'Genres: ';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DetailRichText(
          subtitle: originalTitle,
          text: originalTitleText,
        ),
        UIConstants.lineSpace,
        DetailRichText(
          subtitle: date,
          text: dateText,
        ),
        UIConstants.lineSpace,
        DetailRichText(
          subtitle: vote,
          text: voteText,
        ),
        UIConstants.lineSpace,
        DetailRichText(
          subtitle: genres,
          text: genresText,
        )
      ],
    );
  }
}
