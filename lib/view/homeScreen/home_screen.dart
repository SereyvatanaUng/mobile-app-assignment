import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'component/card_user_screen.dart';
import 'component/header_app.dart';
import 'component/history_view_user.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  bool _showHeader = true;
  double _headerHeight = 100;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (_showHeader) setState(() => _showHeader = false);
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (!_showHeader) setState(() => _showHeader = true);
    }
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0, // Scroll to the top
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 70),
            child: ListView.separated(
              key: const PageStorageKey('home_list'),
              controller: _scrollController,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              itemCount: 13,
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
            top: _showHeader ? 0 : -_headerHeight,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _scrollToTop,
              child: Container(
                height: _headerHeight,
                color: Colors.white, // Header background color
                child: const RepaintBoundary(child: HeaderApp()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
