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
                  "https://instagram.fpnh5-2.fna.fbcdn.net/v/t51.2885-19/470335716_543213718702689_3471928630048107268_n.jpg?_nc_ht=instagram.fpnh5-2.fna.fbcdn.net&_nc_cat=109&_nc_oc=Q6cZ2AG18GqkS2_hXQUaYbIdi9LoNCXZqlNb_S6E9ayoshx3IbuiRO5JTimrD2728nBfPpk&_nc_ohc=5kh5VLUcogkQ7kNvgGuy7jQ&_nc_gid=16ddcbef2bfb4123a9ffaad1c74e7d37&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AYC4ujVZ67j1QBlLdO8AL1_UVrA0f0EY0peS6T-AzdI-GQ&oe=679B07C0&_nc_sid=7d3ac5",
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
