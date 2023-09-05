import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import 'plain_text.dart';

class MovieOverview extends StatelessWidget {
  const MovieOverview({
    super.key,
    required this.overviewText,
  });

  final String overviewText;
  static const String overviewTitle = 'Overview';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          overviewTitle,
          style: UIConstants.subtitleTextStyle,
        ),
        UIConstants.lineSpace,
        PlainText(
          text: overviewText,
        ),
      ],
    );
  }
}
