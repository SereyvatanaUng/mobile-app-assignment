import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/view/app_screen_provider.dart';
import 'package:provider/provider.dart';

import '../theme/theme_provioder.dart';
import 'homeScreen/home_screen.dart';

class AppScreen extends StatelessWidget {
  final List<Widget> _screens = [
    HomeScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    AppScreenProvider provider = Provider.of<AppScreenProvider>(context);

    // Conditionally update the state if the screen needs BottomNavigationBar or not
    // if (provider.currentIndex == 2) { // Example: Index 2 corresponds to the Details screen
    //   provider.toggleBottomNav(false); // Disable BottomNavigationBar for this screen
    // } else {
    //   provider.toggleBottomNav(true); // Enable BottomNavigationBar for other screens
    // }

    return Scaffold(
      body: IndexedStack(
        index: provider.currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: provider.isBottomNavRequired
          ? _bottomNavBar(context)
          : null, // Don't show BottomNavigationBar for non-bottom navigation screens
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    AppScreenProvider provider = context.watch<AppScreenProvider>();
    ThemeLogic themeLogic = context.watch<ThemeLogic>();
    ThemeData theme = Theme.of(context);
    return BottomNavigationBar(
      currentIndex: provider.currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey[800],
      onTap: (index) => provider.updateIndex(index),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_filled),
          label: ''
          // color: theme.appBarTheme.foregroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.search),
          label: ''
          // color: theme.appBarTheme.foregroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.add),
          label: ''
          // color: theme.appBarTheme.foregroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.slow_motion_video_sharp),
          label: ''
          // color: theme.appBarTheme.foregroundColor,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.account_circle),
          label: ''
          // color: theme.appBarTheme.foregroundColor,
        ),
      ],
    );
  }
}

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../theme/theme_provioder.dart';
//
// class AppScreen extends StatefulWidget {
//
//
//   @override
//   State<AppScreen> createState() => _State();
// }
//
// class _State extends State<AppScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final themeLogic = Provider.of<ThemeLogic>(context);
//
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AppScreen(),
//       theme: themeLogic.lightTheme, // Light theme
//       darkTheme: themeLogic.darkTheme, // Dark theme
//       themeMode: themeLogic.mode,
//     );
//   }
// }
