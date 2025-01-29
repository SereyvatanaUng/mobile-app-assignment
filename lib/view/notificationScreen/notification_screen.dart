import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'component/profile_image.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Map<String, dynamic>> notifications = [
      {
        "title":
            "lucas_sky, sarah_moon, and others want to follow you on Threads, Instagram's new text app.",
        "profileImage": [
          "https://i.pinimg.com/736x/ac/96/a8/ac96a85fa256de2f832a3641765b0d56.jpg"
        ],
        "time": "5m",
        "isFollowable": true,
        "hasStory": false
      },
      {
        "title":
            "john_doe, jane_smith, and others want to follow you on Threads, Instagram's new text app.",
        "profileImage": [
          "https://i.pinimg.com/736x/fa/8b/e4/fa8be41486f9cbb1d3626aeac68d8ce5.jpg"
        ],
        "time": "12m",
        "isFollowable": true,
        "hasStory": false
      },
      {
        "title":
            "alex_rock, emily_bright, and others want to follow you on Threads, Instagram's new text app.",
        "profileImage": [
          "https://i.pinimg.com/736x/24/8b/66/248b6652fffd4cdbb117e7ea7757c0f4.jpg"
        ],
        "time": "25m",
        "isFollowable": false,
        "hasStory": true
      },
      {
        'title':
            'ka_sokna, rin_vouchnea, and others want to follow you on Threads, Instagram\'s new text app.',
        'profileImage': [
          'https://i.pinimg.com/736x/41/49/3f/41493f14c62a532266f742584736e876.jpg'
        ],
        'time': '39m',
        'isFollowable': false,
        'hasStory': true,
      },
      {
        'title': 'sordavika, who you might know, is on Instagram.',
        'profileImage': [
          'https://i.pinimg.com/736x/fa/8b/e4/fa8be41486f9cbb1d3626aeac68d8ce5.jpg'
        ],
        'time': '1h',
        'isFollowable': true,
      },
      {
        'title': 'monyrethchan, who you might know, is on Instagram.',
        'profileImage': [
          'https://i.pinimg.com/736x/60/3f/c6/603fc6eb970de1c7eaac26c8c6da1126.jpg'
        ],
        'time': '1d',
        'isFollowable': true,
        'hasStory': false,
      },
      {
        'title': 'langoutdom, who you might know, is on Instagram.',
        'profileImage': [
          "https://i.pinimg.com/736x/24/8b/66/248b6652fffd4cdbb117e7ea7757c0f4.jpg"
        ],
        'time': '2d',
        'isFollowable': true,
        'hasStory': false,
      },
      {
        'title':
            'Follow Dara, SovanSak and others you know to see their photos and videos.',
        'profileImage': [
          'https://i.pinimg.com/736x/60/3f/c6/603fc6eb970de1c7eaac26c8c6da1126.jpg'
        ],
        'time': '4d',
        'isFollowable': false,
        'hasStory': false,
      },
      {
        'title': 'dav_ddec started following you.',
        'profileImage': [
          'https://i.pinimg.com/736x/60/3f/c6/603fc6eb970de1c7eaac26c8c6da1126.jpg'
        ],
        'time': '4d',
        'isFollowable': false,
        'isFollowing': true,
        'hasStory': false,
      },
      {
        "title":
            "mia_sunshine, charlie_kay, and others want to follow you on Threads, Instagram's new text app.",
        "profileImage": [
          "https://i.pinimg.com/736x/87/7f/da/877fda4259fcaddb8833fe8775f83035.jpg"
        ],
        "time": "1h",
        "isFollowable": false,
        "hasStory": true
      },
      {
        "title":
            "noah_rain, sophia_glow, and others want to follow you on Threads, Instagram's new text app.",
        "profileImage": [
          "https://i.pinimg.com/736x/24/8b/66/248b6652fffd4cdbb117e7ea7757c0f4.jpg"
        ],
        "time": "3h",
        "isFollowable": true,
        "hasStory": false
      },
      {
        'title': 'tykhoeurn is on Instagram. ka_sokna follows them.',
        'profileImage': [
          'https://i.pinimg.com/736x/60/3f/c6/603fc6eb970de1c7eaac26c8c6da1126.jpg'
        ],
        'time': '5d',
        'isFollowable': true,
        'hasStory': false,
      },
      {
        'title': '6.jan_ and 3 others recently added to their stories.',
        'profileImage': [
          'https://i.pinimg.com/736x/d8/6e/97/d86e974acb88a2c14bf6402f176c2cc6.jpg'
        ],
        'time': '13h',
        'isFollowable': false,
        'hasStory': true,
      },
    ];

    //TODO Group notifications by time categories
    final groupedNotifications = _groupNotificationsByTime(notifications);

    return Scaffold(
      appBar: _buildAppBar(context, theme, title: "Notifications"),
      body: _buildGroupedNotificationBody(theme, groupedNotifications),
    );
  }

  AppBar _buildAppBar(BuildContext context, ThemeData theme,
      {required String title}) {
    return AppBar(
      backgroundColor: theme.appBarTheme.backgroundColor,
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Image.asset("lib/assets/fi_chevron-left.png",
              color: theme.appBarTheme.foregroundColor)),
      title: Text(
        title,
        style: TextStyle(
          color: theme.appBarTheme.foregroundColor,
        ),
      ),
      centerTitle: false,
    );
  }

  Map<String, List<Map<String, dynamic>>> _groupNotificationsByTime(
      List<Map<String, dynamic>> notifications) {
    final Map<String, List<Map<String, dynamic>>> groupedNotifications = {
      'Today': [],
      'Yesterday': [],
      'Last Week': [],
    };

    for (var notification in notifications) {
      final time = notification['time'];
      if (time.contains('m') || time.contains('h')) {
        groupedNotifications['Today']?.add(notification);
      } else if (time.contains('1d')) {
        groupedNotifications['Yesterday']?.add(notification);
      } else {
        groupedNotifications['Last Week']?.add(notification);
      }
    }
    return groupedNotifications;
  }

  Widget _buildGroupedNotificationBody(ThemeData theme,
      Map<String, List<Map<String, dynamic>>> groupedNotifications) {
    final textStyle =
        TextStyle(color: theme.appBarTheme.foregroundColor, fontSize: 14);
    final subtitleStyle = const TextStyle(color: Colors.grey, fontSize: 12);

    return ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: groupedNotifications.length,
      itemBuilder: (context, groupIndex) {
        final groupTitle = groupedNotifications.keys.elementAt(groupIndex);
        final notifications = groupedNotifications[groupTitle]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Group title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                groupTitle,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Notifications list
            ...notifications.map((notification) {
              final profileImage =
                  notification['profileImage']?.isNotEmpty == true
                      ? notification['profileImage'][0]
                      : null;

              return ListTile(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                leading: ProfileImage(
                  profileImages: [profileImage ?? ''],
                  hasStory: notification['hasStory'] ?? false,
                ),
                title: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: notification['title'],
                        style: textStyle, // Style for the title
                      ),
                      TextSpan(
                        text:
                            " ${notification['time']}", // Add time with a dot separator
                        style: subtitleStyle, // Style for the time
                      ),
                    ],
                  ),
                ),
                trailing: _buildTrailingWidget(notification),
              );
            }),
          ],
        );
      },
    );
  }

  Widget? _buildTrailingWidget(Map<String, dynamic> notification) {
    if (notification['isFollowable'] == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Follow'),
      );
    } else if (notification['isFollowing'] == true) {
      return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text('Following'),
      );
    }
    return null;
  }
}
