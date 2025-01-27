import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import 'package:provider/provider.dart';

import 'component/information_user.dart';
import 'component/upload_post_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);

    return Scaffold(
      appBar: _buildAppBar(context, theme, themeLogic),
      body: SingleChildScrollView(
        // Added to prevent overflow in case content exceeds screen size
        child: Column(
          children: const [
            RepaintBoundary(child: InformationUser()),
            RepaintBoundary(child: UploadPostUser()),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(
      BuildContext context, ThemeData theme, ThemeLogic themeLogic) {
    return AppBar(
      title: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                left: 1.0), // Space only on the left side of the text
            child: Text(
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
            onPressed: () {},
          ),
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
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.add),
          iconSize: 28,
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            'lib/assets/fi_menu.png',
            color: theme.appBarTheme.foregroundColor,
            width: 25,
          ),
          iconSize: 20,
          onPressed: () {},
        ),
      ],
    );
  }
}
