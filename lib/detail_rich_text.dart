import 'package:flutter/material.dart';

import 'ui_constants.dart';

class DetailRichText extends StatelessWidget {
  const DetailRichText({
    super.key,
    required this.subtitle,
    required this.text,
  });

  final String subtitle;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.movie_creation_outlined,
          color: UIConstants.contrastColor,
        ),
        UIConstants.listIconSpace,
        Text(
          subtitle,
          style: UIConstants.subtitleTextStyle,
        ),
        Expanded(
          child: Text(
            text,
            style: UIConstants.plainTextStyle,
            maxLines: UIConstants.wrapLines,
          ),
        ),
      ],
    );
  }
}
