import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ShaderMaskPractice extends StatefulWidget {
  const ShaderMaskPractice({super.key});

  @override
  State<ShaderMaskPractice> createState() => _ShaderMaskPracticeState();
}

class _ShaderMaskPracticeState extends State<ShaderMaskPractice>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  bool completed = false;

  ui.Image? image;

  Future<void> loadImage() async {
    final imageProvider = AssetImage("assets/img_3.png");
    final stream = imageProvider.resolve(const ImageConfiguration());

    stream.addListener(
      ImageStreamListener((ImageInfo info, bool _) {
        setState(() {
          image = info.image;
        });
      }),
    );
  }

  @override
  void initState() {
    super.initState();
    loadImage();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    controller.forward();

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          completed = true;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) return Center(child: const CircularProgressIndicator());
    return Scaffold(
      appBar: AppBar(title: Text("Shader mask")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Align(
                    alignment: .centerLeft,
                    child: Text(
                      "Top to bottom image reveal",
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Colors.black.withValues(alpha: 0.9),
                              Colors.transparent,
                            ],
                            begin: .topCenter,
                            end: .bottomCenter,
                            stops: [controller.value, controller.value + 0.1],
                          ).createShader(bounds);
                        },
                        blendMode: .dstIn,
                        child: child,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: .circular(10),
                      child: Image.asset("assets/img.png"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (completed)
                    ElevatedButton(
                      onPressed: () {
                        controller.forward(from: 0);
                      },
                      child: Text("Replay image animation"),
                    ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: .centerLeft,
                    child: Text(
                      "Text masked with gradient",
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [Colors.purple, Colors.pink, Colors.blue],
                        begin: .bottomLeft,
                        end: .topRight,
                      ).createShader(bounds);
                    },
                    blendMode: .srcIn,
                    child: Text(
                      "Flutter Is Awesome",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: .bold,
                        letterSpacing: 1.5,
                        color: Colors.white,
                      ),
                      textAlign: .center,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: .centerLeft,
                    child: Text(
                      "Image mask on Text",
                      style: TextStyle(fontSize: 20, fontWeight: .bold),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ShaderMask(
                    blendMode: .srcIn,
                    shaderCallback: (Rect bounds) {
                      return ImageShader(
                        image!,
                        TileMode.clamp,
                        TileMode.clamp,
                        Matrix4.identity().storage,
                      );
                    },
                    child: Text(
                      "Shanghai",
                      style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: .bold,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
