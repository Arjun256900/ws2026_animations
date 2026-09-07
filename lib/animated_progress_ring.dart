import 'package:chatgpt_level_1/ring_painter.dart';
import 'package:flutter/material.dart';

class AnimatedProgressRing extends StatefulWidget {
  const AnimatedProgressRing({super.key});

  @override
  State<AnimatedProgressRing> createState() => _AnimatedProgressRingState();
}

class _AnimatedProgressRingState extends State<AnimatedProgressRing>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> progress;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    progress = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated progress ring")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    return Stack(
                      alignment: .center,
                      children: [
                        CustomPaint(
                          size: Size(200, 200),
                          painter: RingPainter(progress: progress.value),
                        ),
                        Text(
                          "${(progress.value * 100).toInt()}%",
                          style: TextStyle(fontSize: 18, fontWeight: .w500),
                        ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.reset();
                    controller.forward();
                  },
                  child: Text("Start animation"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
