import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/list_data/post_user.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provioder.dart';

class UploadPostUser extends StatefulWidget {
  const UploadPostUser({super.key});

  @override
  State<UploadPostUser> createState() => _UploadPostUserState();
}

class _UploadPostUserState extends State<UploadPostUser> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);
    final iconColor = theme.appBarTheme.foregroundColor ?? Colors.black;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/profile.png',
                    color: iconColor,
                    width: 23,
                    height: 23,
                  ),
                  const SizedBox(height: 5),
                  Container(
                    width: 60,
                    height: 1,
                    color: iconColor,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/fi_play-circle.png',
                    color: iconColor,
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/follow.png',
                    color: iconColor,
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            ],
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: themeLogic.mode == ThemeMode.dark
                      ? Colors.grey.shade900
                      : Colors.grey.shade200,
                ),
              ),
            ),
          ),
          const SizedBox(height: 3),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero, // No padding
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 3,
              mainAxisSpacing: 3,
            ),
            itemCount: post.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  post[index]['imageUrl']!,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
