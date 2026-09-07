import 'package:flutter/material.dart';

class FloatingActionMenu extends StatefulWidget {
  const FloatingActionMenu({super.key});

  @override
  State<FloatingActionMenu> createState() => _FloatingActionMenuState();
}

class _FloatingActionMenuState extends State<FloatingActionMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> rotation;
  late Animation<Offset> button1Slide;
  late Animation<double> button1Opacity;
  late Animation<Offset> button2Slide;
  late Animation<double> button2Opacity;
  late Animation<Offset> button3Slide3;
  late Animation<double> button3Opacity;

  bool isOpen = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    rotation = Tween<double>(begin: 0, end: 0.125).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    button1Slide = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    button1Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.2, 0.5, curve: Curves.easeOut),
      ),
    );

    button2Slide = Tween<Offset>(begin: Offset(0, 1.0), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.4, 0.6, curve: Curves.easeOut),
          ),
        );

    button2Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.4, 0.6, curve: Curves.easeOut),
      ),
    );

    button3Slide3 = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.5, 0.8, curve: Curves.easeOut),
          ),
        );

    button3Opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.5, 0.8, curve: Curves.easeOut),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Floating Action Menu")),
      floatingActionButton: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .end,
        children: [
          FadeTransition(
            opacity: button3Opacity,
            child: SlideTransition(
              position: button3Slide3,
              child: Padding(
                padding: .only(bottom: 10),
                child: FloatingActionButton.small(
                  onPressed: () {},
                  heroTag: "ticket",
                  child: Icon(Icons.airplane_ticket),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: button2Opacity,
            child: SlideTransition(
              position: button2Slide,
              child: Padding(
                padding: .only(bottom: 20),
                child: FloatingActionButton.small(
                  onPressed: () {},
                  heroTag: "edit",
                  child: Icon(Icons.edit),
                ),
              ),
            ),
          ),
          FadeTransition(
            opacity: button1Opacity,
            child: SlideTransition(
              position: button1Slide,
              child: Padding(
                padding: .only(bottom: 20),
                child: FloatingActionButton.small(
                  onPressed: () {},
                  heroTag: "person",
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          RotationTransition(
            turns: rotation,
            child: FloatingActionButton(
              heroTag: "main",
              onPressed: () {
                if (!isOpen) {
                  controller.forward();
                } else {
                  controller.reverse();
                }
                isOpen = !isOpen;
              },
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
