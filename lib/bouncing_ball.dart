import 'package:flutter/material.dart';

class BouncingBall extends StatefulWidget {
  const BouncingBall({super.key});

  @override
  State<BouncingBall> createState() => _BouncingBallState();
}

class _BouncingBallState extends State<BouncingBall>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> topPosition;
  late Animation<double> scale;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bouncing ball")),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: .expand,
            children: [
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Divider(thickness: 2, color: Colors.black),
              ),
            ],
          );
        },
      ),
    );
  }
}
