import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/view/addPostScreen/add_post_screen.dart';
import 'package:mobile_app_assignment/view/app_screen_provider.dart';
import 'package:mobile_app_assignment/view/notificationScreen/notification_screen.dart';
import 'package:mobile_app_assignment/view/profileScreen/profile_screen.dart';
import 'package:mobile_app_assignment/view/searchScreen/search_screen.dart';
import 'package:provider/provider.dart';
import '../theme/theme_provioder.dart';
import 'homeScreen/home_screen.dart';

class AppScreen extends StatelessWidget {
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    AddPostScreen(),
    ProfileScreen(),
    NotificationScreen()
  ];

  @override
  Widget build(BuildContext context) {
    AppScreenProvider provider = Provider.of<AppScreenProvider>(context);

    return Scaffold(
      body: IndexedStack(
        index: provider.currentIndex,
        children: _screens,
      ),
      bottomNavigationBar:
          provider.isBottomNavRequired ? _bottomNavBar(context) : null,
    );
  }

  Widget _bottomNavBar(BuildContext context) {
    AppScreenProvider provider = context.watch<AppScreenProvider>();
    ThemeLogic themeLogic = context.watch<ThemeLogic>();
    ThemeData theme = Theme.of(context);

    return Container(
      height: 100,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: themeLogic.mode == ThemeMode.dark
                ? Colors.grey.shade900
                : Colors.grey.shade200,
          ),
        ),
      ),
      child: BottomNavigationBar(
        currentIndex: provider.currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: theme.appBarTheme.foregroundColor,
        selectedFontSize: 0,
        unselectedItemColor: theme.iconTheme.color,
        onTap: (index) {
          provider.updateIndex(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: provider.currentIndex == 0
                  ? theme.appBarTheme.foregroundColor
                  : theme.iconTheme.color,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: provider.currentIndex == 1
                  ? theme.appBarTheme.foregroundColor
                  : theme.iconTheme.color,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add,
              size: 30,
              color: provider.currentIndex == 2
                  ? theme.appBarTheme.foregroundColor
                  : theme.iconTheme.color,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              size: 28,
              color: provider.currentIndex == 3
                  ? theme.appBarTheme.foregroundColor
                  : theme.iconTheme.color,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
