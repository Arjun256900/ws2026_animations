import 'package:flutter/material.dart';

class AnimatedGradient extends StatefulWidget {
  const AnimatedGradient({super.key});

  @override
  State<AnimatedGradient> createState() => _AnimatedGradientState();
}

class _AnimatedGradientState extends State<AnimatedGradient>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Alignment> topAlignment;
  late Animation<Alignment> bottomAlignment;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat(reverse: true);

    topAlignment = TweenSequence<Alignment>([
      TweenSequenceItem(
        tween: AlignmentTween(begin: .centerLeft, end: .topRight),
        weight: 1,
      ),

      TweenSequenceItem(
        tween: AlignmentTween(begin: .topRight, end: .center),
        weight: 1,
      ),

      TweenSequenceItem(
        tween: AlignmentTween(begin: .center, end: .bottomCenter),
        weight: 1,
      ),

      TweenSequenceItem(
        tween: AlignmentTween(begin: .bottomCenter, end: .topLeft),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    bottomAlignment = TweenSequence([
      TweenSequenceItem(
        tween: AlignmentTween(begin: .bottomRight, end: .topLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(begin: .topRight, end: .topRight),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(begin: .topRight, end: .bottomLeft),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: AlignmentTween(begin: .bottomLeft, end: .bottomRight),
        weight: 1,
      ),
    ]).animate(CurvedAnimation(parent: controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Gradient")),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context, child) {
                return Container(
                  height: 280,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF8A2387).withValues(alpha: 0.8),
                        Color(0xFF8A2387).withValues(alpha: 0.8),
                        Color(0xFFE94057),
                        Color(0xFFE94057).withValues(alpha: 0.8),
                        Color(0xFFF27121).withValues(alpha: 0.8),
                      ],

                      begin: topAlignment.value,
                      end: bottomAlignment.value,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
