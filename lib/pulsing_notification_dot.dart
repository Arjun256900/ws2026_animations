import 'package:flutter/material.dart';

class PulsingNotificationDot extends StatefulWidget {
  const PulsingNotificationDot({super.key});

  @override
  State<PulsingNotificationDot> createState() => _PulsingNotificationDotState();
}

class _PulsingNotificationDotState extends State<PulsingNotificationDot>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleTween;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    scaleTween = Tween<double>(
      begin: 1,
      end: 1.5,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));

    controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pulsing dot")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                ScaleTransition(
                  scale: scaleTween,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: .circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
