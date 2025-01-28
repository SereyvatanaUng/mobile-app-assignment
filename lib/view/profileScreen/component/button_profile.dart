import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/list_data/history_prolife.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provioder.dart';

class ButtonProfile extends StatefulWidget {
  const ButtonProfile({super.key});

  @override
  State<ButtonProfile> createState() => _ButtonProfileState();
}

class _ButtonProfileState extends State<ButtonProfile> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);


    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    theme.appBarTheme.backgroundColor ?? theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  child: Text(
                    'Edit profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.appBarTheme.foregroundColor ??
                          theme.colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    theme.appBarTheme.backgroundColor ?? theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  child: Text(
                    'Share profile',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: theme.appBarTheme.foregroundColor ??
                          theme.colorScheme.onPrimary,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: history.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                          borderRadius: BorderRadius.circular(84),
                        ),
                        child: ClipOval(
                          child: Image.network(
                            history[index]['imageUrl']!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        history[index]['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );

  }
}

