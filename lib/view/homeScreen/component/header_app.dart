import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provioder.dart';

class HeaderApp extends StatelessWidget {
  const HeaderApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
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
          icon: Icon(
            themeLogic.mode == ThemeMode.dark
                ? Icons.dark_mode_outlined
                : Icons.light_mode_outlined,
          ),
          iconSize: 28,
          color: theme.appBarTheme.foregroundColor,
          onPressed: () => _toggleTheme(themeLogic),
        ),
        IconButton(
          icon: const Icon(Icons.favorite_border_rounded),
          iconSize: 28,
          color: theme.appBarTheme.foregroundColor,
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            'lib/assets/fi_send.png',
            color: theme.appBarTheme.foregroundColor,
            width: 25,
          ),
          iconSize: 28, // Consistent icon size
          onPressed: () {},
        ),
      ],
    );
  }

  void _toggleTheme(ThemeLogic themeLogic) {
    if (themeLogic.mode == ThemeMode.dark) {
      themeLogic.changeToLight();
    } else {
      themeLogic.changeToDark();
    }
  }
}
