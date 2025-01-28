import 'package:flutter/material.dart';
import 'package:mobile_app_assignment/list_data/upload_post.dart';

class CardUserScreen extends StatefulWidget {
  const CardUserScreen({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _CardUserScreenState createState() => _CardUserScreenState();
}

class _CardUserScreenState extends State<CardUserScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (widget.index < 0 || widget.index >= uploadPost.length) {
      return const Center(
        child: Text('Invalid post index.'),
      );
    }

    final post = uploadPost[widget.index];

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: post['profile'] != null
                      ? NetworkImage(post['profile']!)
                      : const AssetImage('lib/assets/default_avatar.png')
                  as ImageProvider,
                ),
                const SizedBox(width: 8),
                Text(
                  post['name'] ?? 'User',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: 28,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          // Image section
          post['imageUrl'] != null
              ? Image.network(
            post['imageUrl']!,
            fit: BoxFit.cover,
            width: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(Icons.broken_image, size: 50),
              );
            },
          )
              : const Center(child: Icon(Icons.image_not_supported)),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border_rounded),
                          color: theme.appBarTheme.foregroundColor,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            'lib/assets/fi_message-circle.png',
                            color: theme.appBarTheme.foregroundColor,
                            width: 23,
                          ),
                        ),
                        IconButton(
                          icon: Image.asset(
                            'lib/assets/fi_send.png',
                            color: theme.appBarTheme.foregroundColor,
                            width: 22,
                          ),
                          iconSize: 20,
                          onPressed: () {},
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        'lib/assets/fi_bookmark.png',
                        color: theme.appBarTheme.foregroundColor,
                        width: 22,
                      ),
                      iconSize: 20,
                    ),
                  ],
                ),
                const SizedBox(height: 3),
                const Text(
                  "Like 100",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: post['name'] ?? 'User',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const TextSpan(
                          text: ' This post is amazing! Keep shining! 🌟'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/33/8f/e6/338fe651e97c686dd08aec020502ec2e.jpg',
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text('Add comment...'),
                      const Spacer(),
                      const Text(
                        '😍',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        '🥹',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
