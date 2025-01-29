import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app_assignment/theme/theme_provioder.dart';
import '../../../list_data/list_user.dart';

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
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
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
