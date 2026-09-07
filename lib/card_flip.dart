import 'dart:math';

import 'package:flutter/material.dart';

class CardFlip extends StatefulWidget {
  const CardFlip({super.key});

  @override
  State<CardFlip> createState() => _CardFlipState();
}

class _CardFlipState extends State<CardFlip>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;

  bool isFlipped = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    rotation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Card flip")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                GestureDetector(
                  onTap: () {
                    if (isFlipped) {
                      controller.reverse();
                    } else {
                      controller.forward();
                    }
                    isFlipped = !isFlipped;
                  },
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      final angle = rotation.value;
                      final isHalfPast = angle > (pi / 2);
                      return Transform(
                        alignment: .center,
                        transform: Matrix4.identity()
                          ..setEntry(3, 2, 0.001)
                          ..rotateY(angle),
                        child: isHalfPast ? buildBackCard() : buildFrontCard(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFrontCard() {
    return Container(
      width: 300,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      alignment: Alignment.center,
      child: const Text(
        "💳 CARD FRONT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget buildBackCard() {
    return Transform(
      transform: Matrix4.identity()..rotateY(pi),
      alignment: .center,
      child: Container(
        width: 300,
        height: 180,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: const Text(
          "🔒 CARD BACK",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
