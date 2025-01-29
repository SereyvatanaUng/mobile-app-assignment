import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/list_data/notification.dart';

import 'component/profile_image.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final notifications = Notifications_data;

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
