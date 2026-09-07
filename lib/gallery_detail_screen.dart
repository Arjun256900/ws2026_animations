import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatefulWidget {
  final String image;
  final int index;

  const GalleryDetailScreen({
    super.key,
    required this.image,
    required this.index,
  });

  @override
  State<GalleryDetailScreen> createState() => _GalleryDetailScreenState();
}

class _GalleryDetailScreenState extends State<GalleryDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Gallery image")),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Hero(
                tag: widget.index.toString(),
                child: Image.asset(widget.image, width: .infinity, fit: .cover),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
