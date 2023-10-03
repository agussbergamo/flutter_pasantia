import 'package:flutter/material.dart';

import '../../core/util/string_constants.dart';
import '../../core/util/ui_constants.dart';
import 'app_drawer_tile.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  static const String drawerHeader = 'What do you feel like watching?';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: UIConstants.backgroundColor,
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: UIConstants.backgroundColor,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                drawerHeader,
                style: UIConstants.titleTextStyle,
              ),
            ),
          ),
          AppDrawerTile(
            title: StringConstants.popularTitle,
            routeName: StringConstants.popularRouteName,
          ),
          AppDrawerTile(
            title: StringConstants.topRatedTitle,
            routeName: StringConstants.topRatedRouteName,
          ),
          AppDrawerTile(
            title: StringConstants.upcomingTitle,
            routeName: StringConstants.upcomingRouteName,
          ),
          AppDrawerTile(
            title: StringConstants.nowPlayingTitle,
            routeName: StringConstants.nowPlayingRouteName,
          ),
        ],
      ),
    );
  }
}
