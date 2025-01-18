import 'package:mobile_app_assignment/homeScreen/image_data.dart';
import 'package:flutter/material.dart';

class CardUserScreen extends StatefulWidget {
  const CardUserScreen({super.key});

  @override
  State<CardUserScreen> createState() => _CardUserScreenState();
}

class _CardUserScreenState extends State<CardUserScreen> {
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
        const Text(
          "Beautiful Of Cambodia",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildViewListNew(imgKhmer, 250, 180),
        const Text(
          "Beautiful Of China",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildViewListNew(imgChina, 200, 180),
        const Text(
          "Beautiful Of Korea",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildViewListNew(imgKorea, 250, 180),
        const Text(
          "Beautiful Of Japan",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        _buildViewListNew(imgJapan, 250, 180),
      ],
    );
  }

  Widget _buildViewListNew(List<String> imageList, double height, double width) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: imageList.length,
        itemBuilder: (context, index) {
          return Container(
            width: width,
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              imageList[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
