import 'package:flutter/material.dart';

import '../../ui_constants.dart';
import 'detail_rich_text.dart';

class MovieInfo extends StatelessWidget {
  const MovieInfo({
    super.key,
    required this.originalTitleText,
    required this.originalLanguageText,
    required this.dateText,
    required this.genresText,
    required this.ratedText,
  });

  final String originalTitleText;
  final String originalLanguageText;
  final String dateText;
  final String genresText;
  final bool ratedText;
  static const String originalTitle = 'Original title: ';
  static const String originalLanguage = 'Original language: ';
  static const String date = 'Release date: ';
  static const String genres = 'Genres: ';
  static const String rated = 'Rated: ';
  static const String restricted = 'Restricted';
  static const String generalAudiences = 'General Audiences';

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
          subtitle: originalLanguage,
          text: originalLanguageText,
        ),
        UIConstants.lineSpace,
        DetailRichText(
          subtitle: date,
          text: dateText,
        ),
        UIConstants.lineSpace,
        DetailRichText(
          subtitle: genres,
          text: genresText,
        ),
        UIConstants.lineSpace,
        DetailRichText(
          subtitle: rated,
          text: ratedText ? restricted : generalAudiences,
        ),
      ],
    );
  }
}
