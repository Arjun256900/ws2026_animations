import 'package:flutter/material.dart';

class PulseAnimationJapan extends StatefulWidget {
  const PulseAnimationJapan({super.key});

  @override
  State<PulseAnimationJapan> createState() => _PulseAnimationJapanState();
}

class _PulseAnimationJapanState extends State<PulseAnimationJapan>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );

    scale = Tween<double>(begin: 1, end: 1.5).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastEaseInToSlowEaseOut,
      ),
    );

    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pulse animation japan")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Stack(
                  alignment: .center,
                  children: [
                    ScaleTransition(
                      scale: scale,
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: .circle,
                          color: Colors.green.withValues(alpha: 0.15),
                        ),
                      ),
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      alignment: .center,
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: Colors.green,
                      ),
                      child: Icon(Icons.check),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
