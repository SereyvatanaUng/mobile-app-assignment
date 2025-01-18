import 'image_data.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return _buildViewList();
  }

  Widget _buildViewList() {
    return ListView(
      padding: const EdgeInsets.all(10),
      physics: const BouncingScrollPhysics(),
      children: [
        _buildSection(imgKhmer, 90, 90),
      ],
    );
  }

  Widget _buildSection(List<String> imageList, double height, double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildViewListNew(imageList, height, width),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildViewListNew(
      List<String> imageList, double height, double width) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              border: Border.all(
                width: 5,
                color: Colors.transparent,
              ),
              gradient: const LinearGradient(
                colors: [
                  Color(0xFFFEDA75), 
                  Color(0xFFFA7E1E), 
                  Color(0xFFD62976), 
                  Color(0xFF962FBF), 
                  Color(0xFF4F5BD5), 
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                imageList[index],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.error),
              ),
            ),
          );
        },
      ),
    );
  }
}
