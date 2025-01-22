import 'package:flutter/material.dart';

class CardUserScreen extends StatefulWidget {
  const CardUserScreen({Key? key, required int index}) : super(key: key);

  @override
  _CardUserScreenState createState() => _CardUserScreenState();
}

class _CardUserScreenState extends State<CardUserScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
                  backgroundImage: const NetworkImage(
                    'https://i.pinimg.com/736x/ad/06/e0/ad06e08cd81d5c478f708752a0844e9e.jpg',
                  ),
                ),
                const SizedBox(width: 8),
                const Text('Heang Heang'),
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
          Image.network(
            'https://i.pinimg.com/736x/c2/f7/7d/c2f77d30413728a71e2ba40c109255e4.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
                const SizedBox(height: 5), // Space between elements
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const <TextSpan>[
                      TextSpan(
                          text: 'Kim: ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: 'This post is amazing! Keep shining! 🌟'),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [
                      const CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          'https://i.pinimg.com/736x/33/8f/e6/338fe651e97c686dd08aec020502ec2e.jpg',
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text('Add comment...'),
                      Spacer(),
                      Text(
                        '😍',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '🥹',
                        style: TextStyle(fontSize: 20),
                      ),
                    ]))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
