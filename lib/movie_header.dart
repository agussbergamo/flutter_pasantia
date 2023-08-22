import 'package:flutter/material.dart';

import 'ui_constants.dart';

class MovieHeader extends StatelessWidget {
  const MovieHeader({super.key, required this.backdrop, required this.title});

  final String backdrop;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          image: AssetImage(
            backdrop,
          ),
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: UIConstants.titlePositionBottom,
          left: UIConstants.titlePositionLeft,
          right: UIConstants.titlePositionRight,
          child: Container(
            height: UIConstants.titleContainerHeight,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black.withOpacity(UIConstants.titleContainerOpacity),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: UIConstants.titleTextStyle,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
