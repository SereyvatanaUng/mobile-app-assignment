import 'package:flutter/material.dart';
import 'component/card_user_screen.dart';
import 'component/history_view_user.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: _buildAppBar(theme, context),
      body: _buildBody(theme),
    );
  }

  AppBar _buildAppBar(ThemeData theme, BuildContext context) {
    final themeLogic = Provider.of<ThemeLogic>(context);

    return AppBar(
      title: Image.asset(
        'lib/assets/Instagram_logo.png',
        width: 150,
        fit: BoxFit.contain,
        color: theme.appBarTheme.foregroundColor,
      ),
      backgroundColor: theme.appBarTheme.backgroundColor,
      actions: [
        IconButton(
          icon: Icon(themeLogic.mode == ThemeMode.dark
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          iconSize: 28,
          onPressed: () {
            // Toggle between light and dark mode
            if (themeLogic.mode == ThemeMode.dark) {
              themeLogic.changeToLight();
            } else {
              themeLogic.changeToDark();
            }
          },
          color: theme.appBarTheme.foregroundColor,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border_rounded),
          iconSize: 28,
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'lib/assets/fi_send.png',
            color: theme.appBarTheme.foregroundColor,
            width: 25,
          ),
          iconSize: 20,
        ),
      ],
    );
  }

  Widget _buildBody(ThemeData theme) {
    return Expanded(
      child: Column(
        children: [
          Expanded(child: HistoryViewUser()), // Ensure MenuScreen expands correctly
          Expanded(child: CardUserScreen()), // Ensure MenuScreen expands correctly
        ],
      ),
    );
  }
}
