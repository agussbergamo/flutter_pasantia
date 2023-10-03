import 'package:flutter/material.dart';

import '../../core/util/ui_constants.dart';

class AppDrawerTile extends StatelessWidget {
  final String title;
  final String routeName;

  AppDrawerTile({
    super.key,
    required this.title,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: UIConstants.drawerTextStyle,
      ),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushNamed(
          context,
          routeName,
        );
      },
    );
  }
}
