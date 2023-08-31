import 'package:flutter/material.dart';

import '../../ui_constants.dart';

class PlainText extends StatelessWidget {
  const PlainText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: UIConstants.plainTextStyle,
    );
  }
}
