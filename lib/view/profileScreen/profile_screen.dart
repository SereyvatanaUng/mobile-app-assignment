import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobile_app_assignment/view/profileScreen/component/button_profile.dart';
import 'component/header_app_profileuser.dart';
import 'component/information_user.dart';
import 'component/upload_post_user.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late ScrollController _scrollController;
  bool _showHeader = true; // Controls visibility of the HeaderAppProfileUser
  final double _headerHeight = 120; // Height of the header

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
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Main content with scrolling
          ListView(
            controller: _scrollController,
            padding: EdgeInsets.only(top: _headerHeight),
            children: const [
              RepaintBoundary(child: InformationUser()),
              RepaintBoundary(child: ButtonProfile()),
              RepaintBoundary(child: UploadPostUser()),
            ],
          ),
          // Animated header
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            top: _showHeader ? 0 : -_headerHeight, // Show/hide the header
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: _scrollToTop, // Scroll to top on header tap
              child: Container(
                height: _headerHeight,
                color: Colors.white,
                child: const RepaintBoundary(child: HeaderAppProfileUser()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
