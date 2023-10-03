import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';

class MovieListHeader extends StatelessWidget {
  const MovieListHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: UIConstants.titleTextStyle,
      ),
    );
  }
}
