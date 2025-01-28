import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../theme/theme_provioder.dart';

class InformationUser extends StatefulWidget {
  const InformationUser({Key? key}) : super(key: key);

  @override
  State<InformationUser> createState() => _InformationUserState();
}

class _InformationUserState extends State<InformationUser> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final themeLogic = Provider.of<ThemeLogic>(context);

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipOval(
                child: Image.network(
                  'https://i.pinimg.com/736x/c2/fd/c7/c2fdc709237d8637de99fd11a153335b.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '47',
                      style: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'posts',
                      style: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '603',
                      style: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'followers',
                      style: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      '563',
                      style: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      'following',
                      style: TextStyle(
                        color: theme.appBarTheme.foregroundColor,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            '@7s._meeeee',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: Colors.lightBlue.shade300,
            ),
          ),
          Text(
            'Intelligence first 🧠☄️ \n'
            'beauty after 🌙✨\n'
            'The girl with coding and technology 🎓',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: theme.appBarTheme.foregroundColor,
            ),
          ),
          // const SizedBox(height: 5),
        ],
      ),
    );
  }
}
