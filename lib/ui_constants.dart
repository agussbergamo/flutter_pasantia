import 'package:flutter/material.dart';

abstract class UIConstants {
  static const backgroundColor = Colors.black12;
  static const contrastColor = Colors.white70;

  static const titleTextStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: 'Roboto',
    color: contrastColor,
  );
  static const subtitleTextStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Roboto',
    color: contrastColor,
    fontWeight: FontWeight.bold,
  );
  static const plainTextStyle = TextStyle(
    fontSize: 15,
    fontFamily: 'Roboto',
    color: contrastColor,
  );
  static const lineSpace = SizedBox(
    height: 10,
  );
  static const sectionSpace = SizedBox(
    height: 30,
  );
  static const listIconSpace = SizedBox(
    width: 10,
  );
  static const paddingPlayButton = EdgeInsets.fromLTRB(
    50,
    5,
    50,
    5,
  );
  static const wrapLines = 2;
  static const titleContainerHeight = 60.0;
  static const titlePositionBottom = 0.0;
  static const titlePositionLeft = 0.0;
  static const titlePositionRight = 0.0;
  static const titleContainerOpacity = 0.7;
  static const columnPadding = 20.0;
  static const buttonBorderRadius = 5.0;
  static const moviesListImageSize = 150.0;
  static const movieImageBorderRadius = 10.0;
}
