import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart'; // Ensure this file name is correct

class HistoryViewUser extends StatefulWidget {
  const HistoryViewUser({super.key});

  @override
  State<HistoryViewUser> createState() => _HistoryViewUserState();
}

class _HistoryViewUserState extends State<HistoryViewUser> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return _buildViewList();
  }

  Widget _buildViewList() {
    final themeLogic =
        Provider.of<ThemeLogic>(context); // Correct Provider usage

    // List of sample profiles
    final List<Map<String, String>> profiles = [
      {
        'name': 'Your Story',
        'imageUrl':
            'https://i.pinimg.com/736x/41/49/3f/41493f14c62a532266f742584736e876.jpg'
      },
      {
        'name': 'John Doe',
        'imageUrl': 'https://i.pinimg.com/736x/fa/8b/e4/fa8be41486f9cbb1d3626aeac68d8ce5.jpg'
      },
      {
        'name': 'Jane Smith',
        'imageUrl': 'https://i.pinimg.com/736x/d8/6e/97/d86e974acb88a2c14bf6402f176c2cc6.jpg'
      },
      {
        'name': 'Your Story',
        'imageUrl':
            'https://i.pinimg.com/736x/60/3f/c6/603fc6eb970de1c7eaac26c8c6da1126.jpg'
      },
      {
        'name': 'John Doe',
        'imageUrl': 'https://i.pinimg.com/736x/3b/31/d4/3b31d4d5c173381a248b037be2208249.jpg'
      },
      {
        'name': 'Jane Smith',
        'imageUrl': 'https://i.pinimg.com/736x/87/7f/da/877fda4259fcaddb8833fe8775f83035.jpg'
      },
      {
        'name': 'Your Story',
        'imageUrl':
            'https://i.pinimg.com/736x/16/0e/d9/160ed9b1029d84c00b761c7f30ebba5c.jpg'
      },
      {
        'name': 'John Doe',
        'imageUrl': 'https://i.pinimg.com/736x/ac/96/a8/ac96a85fa256de2f832a3641765b0d56.jpg'
      },
      {
        'name': 'Jane Smith',
        'imageUrl': 'https://i.pinimg.com/736x/33/8f/e6/338fe651e97c686dd08aec020502ec2e.jpg'
      },
      // Add more profiles as needed
    ];

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: profiles.map((profile) {
              return Padding(
                padding: const EdgeInsets.only(right: 16),
                // Space between items
                child: Column(
                  children: [
                    Container(
                      width: 68,
                      height: 68,
                      padding: const EdgeInsets.all(2.3),
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xFFDE0046),
                            Color(0xFFF7A34B),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            profile['imageUrl']!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.error, size: 50);
                            },
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      profile['name']!,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: themeLogic.mode == ThemeMode.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
