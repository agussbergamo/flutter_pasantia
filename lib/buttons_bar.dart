import 'package:flutter/material.dart';

import 'plain_text.dart';
import 'ui_constants.dart';

class ButtonsBar extends StatefulWidget {
  const ButtonsBar({super.key});

  @override
  State<ButtonsBar> createState() => _ButtonsBar();
}

class _ButtonsBar extends State<ButtonsBar> {
  int _counter = 0;
  static const String playTrailer = 'Play trailer';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          padding: UIConstants.paddingPlayButton,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(UIConstants.buttonBorderRadius),
            border: Border.all(color: UIConstants.contrastColor),
          ),
          child: const Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: UIConstants.contrastColor,
              ),
              PlainText(
                text: playTrailer,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
                onPressed: _incrementCounter,
                icon: const Icon(Icons.favorite,
                    color: UIConstants.contrastColor)),
            PlainText(
              text: '$_counter',
            )
          ],
        ),
      ],
    );
  }
}
