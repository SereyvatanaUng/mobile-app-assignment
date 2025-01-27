import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../notificationScreen/notification_screen.dart';
import 'component/card_user_screen.dart';
import 'component/header_app.dart';
import 'component/history_view_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _showHeader = true; // Controls visibility of the HeaderApp
  double _headerHeight = 100; // Height of the HeaderApp

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    // Check scroll direction and update the header visibility
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      // Scrolling down
      if (_showHeader) setState(() => _showHeader = false);
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      // Scrolling up
      if (!_showHeader) setState(() => _showHeader = true);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: _headerHeight),
            child: ListView.separated(
              key: const PageStorageKey('home_list'),
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 10,
              separatorBuilder: (context, index) => const Divider(
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
          ),
          // HeaderApp - Animated based on scroll direction
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _showHeader ? 0 : -_headerHeight, // Removed statusBarHeight
            left: 0,
            right: 0,
            child: Container(
              height: _headerHeight,
              color: Colors.white, // Header background color
              child: const RepaintBoundary(child: HeaderApp()),
            ),
          ),
        ],
      ),
    );
  }
}

