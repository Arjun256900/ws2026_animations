import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({super.key});

  @override
  State<LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> dot1Scale;
  late Animation<double> dot2Scale;
  late Animation<double> dot3Scale;

  Animation<double> _getAnimation({
    required double intervalBegin,
    required double intervalEnd,
  }) {
    return TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1,
          end: 1.5,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 60,
      ),
      TweenSequenceItem(
        tween: Tween<double>(
          begin: 1.5,
          end: 1,
        ).chain(CurveTween(curve: Curves.easeOut)),
        weight: 40,
      ),
    ]).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(intervalBegin, intervalEnd, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1300),
    );

    dot1Scale = _getAnimation(intervalBegin: 0, intervalEnd: 0.45);

    dot2Scale = _getAnimation(intervalBegin: 0.25, intervalEnd: 0.65);

    dot3Scale = _getAnimation(intervalBegin: 0.5, intervalEnd: 1);

    // TRICK HERE TRICK HERE 👇👇👇👇👇 (HACK TO MAKE THE CONTROLLER REPEAT SLIGHTLY BEFORE IT ACTUALLY ENDS)
    controller.addListener(() {
      if (controller.value >= 0.85) {
        controller.forward(from: 0);
      }
    });

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Loading dots")),
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
                    return Row(
                      mainAxisAlignment: .center,
                      children: List.generate(3, (index) {
                        return Transform.scale(
                          scale: index == 0
                              ? dot1Scale.value
                              : index == 1
                              ? dot2Scale.value
                              : dot3Scale.value,
                          child: child,
                        );
                      }),
                    );
                  },
                  child: Padding(
                    padding: .only(right: 5),
                    child: CircleAvatar(backgroundColor: Colors.red, radius: 6),
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
