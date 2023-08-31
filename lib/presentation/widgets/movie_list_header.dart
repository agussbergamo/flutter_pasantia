import 'package:flutter/material.dart';

import '../../ui_constants.dart';

class MovieListHeader extends StatelessWidget {
  const MovieListHeader({
    super.key,
  });

  static const String title = 'Our movies';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        title,
        style: UIConstants.titleTextStyle,
      ),
    );
  }
}
