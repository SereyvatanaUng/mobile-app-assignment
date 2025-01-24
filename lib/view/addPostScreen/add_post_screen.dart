import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_screen_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Post'),
        leading: IconButton(
          icon: Icon(Icons.close), // X icon
          onPressed: () {
            // Reset the index to HomeScreen (or any other desired screen)
            Provider.of<AppScreenProvider>(context, listen: false)
                .updateIndex(0); // Ensure index points to HomeScreen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _postController,
              decoration: InputDecoration(labelText: 'Caption'),
            ),
          ],
        ),
      ),
    );
  }
}
