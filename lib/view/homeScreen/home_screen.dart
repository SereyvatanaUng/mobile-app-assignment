import 'package:flutter/material.dart';
import 'component/card_user_screen.dart';
import 'component/history_view_user.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);

    return Scaffold(
      appBar: _buildAppBar(context, theme, themeLogic),
      body: ListView.separated(
        key: const PageStorageKey('home_list'),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: 18,
        separatorBuilder: (context, index) => const Divider(
          height: 10,
          thickness: 0,
          color: Colors.transparent,
        ),
        itemBuilder: (context, index) {
          if (index == 0) {
            return const RepaintBoundary(child: HistoryViewUser());
          } else {
            return RepaintBoundary(
              child: CardUserScreen(index: index),
            );
          }
        },
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context, ThemeData theme, ThemeLogic themeLogic) {
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
          onPressed: () {},
        ),
        IconButton(
          icon: Image.asset(
            'lib/assets/fi_send.png',
            color: theme.appBarTheme.foregroundColor,
            width: 25,
          ),
          iconSize: 20,
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
