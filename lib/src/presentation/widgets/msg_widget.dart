import 'package:flutter/material.dart';

import 'plain_text.dart';

class MsgWidget extends StatelessWidget {
  final String text;

  MsgWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: PlainText(
        text: text,
      ),
    );
  }
}
