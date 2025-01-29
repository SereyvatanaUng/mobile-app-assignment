import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../app_screen_provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  final TextEditingController _postController = TextEditingController();
  File? _image;
  final picker = ImagePicker();

  Future<void> getImageGallary() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No Image Picked");
      }
    });
  }

  void _submitPost() {
    if (_postController.text.isEmpty && _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please add a caption or a photo before posting.'),
        ),
      );
      return;
    }
    // Add your submission logic here
    print("Post submitted with caption: ${_postController.text}");
    if (_image != null) {
      print("Image path: ${_image!.path}");
    }

    // Clear data after submission
    setState(() {
      _postController.clear();
      _image = null;
    });

    Provider.of<AppScreenProvider>(context, listen: false).updateIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Post'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: isDarkMode ? Colors.black : Colors.white,
        foregroundColor: isDarkMode ? Colors.white : Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Provider.of<AppScreenProvider>(context, listen: false)
                .updateIndex(0);
          },
        ),
        actions: [
          TextButton(
            onPressed: _submitPost,
            child: Text(
              'Post',
              style: TextStyle(
                color: isDarkMode ? Colors.blue.shade300 : Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              InkWell(
                onTap: getImageGallary,
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: isDarkMode
                            ? Colors.grey.shade700
                            : Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(10),
                    color: isDarkMode
                        ? Colors.grey.shade800
                        : Colors.grey.shade200,
                  ),
                  child: _image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Center(
                          child: Icon(
                            Icons.add_a_photo,
                            size: 40,
                            color:
                                isDarkMode ? Colors.grey.shade400 : Colors.grey,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _postController,
                decoration: InputDecoration(
                  hintText: 'Write a caption...',
                  hintStyle: TextStyle(
                      color: isDarkMode
                          ? Colors.grey.shade500
                          : Colors.grey.shade600),
                  border: InputBorder.none,
                ),
                maxLines: 3,
                style: TextStyle(
                  fontSize: 16,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: _submitPost,
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: isDarkMode ? Colors.blue.shade300 : Colors.blue,
          ),
          child: Text(
            'Post',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
