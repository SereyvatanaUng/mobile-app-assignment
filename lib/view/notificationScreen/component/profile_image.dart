import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final List<String> profileImages; // List of profile images
  final bool hasStory; // Indicator for new story

  const ProfileImage({
    Key? key,
    required this.profileImages,
    required this.hasStory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Center(
        child: Stack(
          children: [
            if (hasStory)
            // Gradient border for new story
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: const LinearGradient(
                    colors: [Colors.orange, Colors.red, Colors.pink],
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: _buildProfileContent(),
                ),
              )
            else
              _buildProfileContent(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileContent() {
    if (profileImages.length == 1) {
      // Single profile image
      return CircleAvatar(
        radius: 27,
        backgroundImage: NetworkImage(profileImages.first),
        backgroundColor: Colors.grey.shade200,
      );
    } else {
      // Multiple profile images
      return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white, // Background color
        ),
        child: Stack(
          alignment: Alignment.center,
          children: List.generate(
            profileImages.length,
                (index) {
              final double offset = index * 12.0; // Adjust spacing for overlap
              return Positioned(
                left: offset,
                child: CircleAvatar(
                  radius: 20, // Adjust size for multi-profile
                  backgroundImage: NetworkImage(profileImages[index]),
                  backgroundColor: Colors.grey.shade200,
                ),
              );
            },
          ),
        ),
      );
    }
  }
}