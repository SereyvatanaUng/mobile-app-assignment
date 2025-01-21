import 'package:flutter/material.dart';

class HistoryViewUser extends StatefulWidget {
  const HistoryViewUser({super.key});

  @override
  State<HistoryViewUser> createState() => _HistoryViewUserState();
}

class _HistoryViewUserState extends State<HistoryViewUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildViewList();
  }

  Widget _buildViewList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Horizontal scrollable section for profile image
          Container(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    width: 68,
                    height: 68,
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(0XFFDE0046),
                          Color(0XFFF7A34B),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipOval(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(34),
                          child: Image.network(
                            'https://i.pinimg.com/736x/1f/7c/7f/1f7c7f46af1b33ebe7e4bc9d7482f63d.jpg',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // User name or description text
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "User Name", // Replace with dynamic user data if available
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
