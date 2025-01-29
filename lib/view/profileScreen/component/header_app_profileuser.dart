import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import 'package:provider/provider.dart';

class HeaderAppProfileUser extends StatelessWidget { // Corrected class name capitalization
  const HeaderAppProfileUser({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);

    return _buildAppBar(context, theme, themeLogic); // Return the AppBar widget
  }

  AppBar _buildAppBar(
      BuildContext context, ThemeData theme, ThemeLogic themeLogic) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding:const EdgeInsets.only(top: 10),
            child: const Text(
              '27.meee',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
            icon: Image.asset(
              'lib/assets/chevron-down.png',
              color: theme.appBarTheme.foregroundColor,
              width: 23,
            ),
            onPressed: () {}, // Add functionality here if needed
          ),
          Container(
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(20)
            )
          )
        ],
      ),
      actions: [
        IconButton(
          icon: Image.asset(
            'lib/assets/threads.png',
            color: theme.appBarTheme.foregroundColor,
            width: 25,
          ),
          iconSize: 20,
          onPressed: () {}, // Add functionality here if needed
        ),
        IconButton(
          icon: const Icon(Icons.add),
          iconSize: 28,
          onPressed: () {}, // Add functionality here if needed
        ),
        IconButton(
          icon: Image.asset(
            'lib/assets/fi_menu.png',
            color: theme.appBarTheme.foregroundColor,
            width: 25,
          ),
          iconSize: 20,
          onPressed: () {}, // Add functionality here if needed
        ),
      ],
    );
  }
}
