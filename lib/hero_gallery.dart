import 'package:chatgpt_level_1/gallery_detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroGallery extends StatefulWidget {
  const HeroGallery({super.key});

  @override
  State<HeroGallery> createState() => _HeroGalleryState();
}

class _HeroGalleryState extends State<HeroGallery> {
  final List<String> images = [
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
  ]..shuffle();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero gallery")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Column(
            children: [
              Expanded(
                child: GridView.builder(
                  itemCount: images.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GalleryDetailScreen(
                              image: images[index],
                              index: index,
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: index.toString(),
                        child: Image.asset(images[index], fit: .cover),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
