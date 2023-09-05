import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';
import 'plain_text.dart';

class ButtonsBar extends StatefulWidget {
  ButtonsBar({
    super.key,
    required this.voteAverage,
    required this.voteCount,
  });

  num voteAverage;
  int voteCount;

  @override
  State<ButtonsBar> createState() => _ButtonsBar();
}

class _ButtonsBar extends State<ButtonsBar> {
  static const String playTrailer = 'Play';

  void _incrementCounter() {
    setState(() {
      widget.voteCount++;
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
          children: [
            const Icon(
              Icons.star,
              color: UIConstants.contrastColor,
            ),
            UIConstants.listIconSpace,
            PlainText(
              text: widget.voteAverage.toString(),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton.outlined(
                onPressed: _incrementCounter,
                icon: const Icon(
                  Icons.favorite,
                  color: UIConstants.contrastColor,
                )),
            PlainText(
              text: widget.voteCount.toString(),
            )
          ],
        ),
      ],
    );
  }
}
