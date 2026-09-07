import 'package:flutter/material.dart';

class ExpandableFaq extends StatefulWidget {
  const ExpandableFaq({super.key});

  @override
  State<ExpandableFaq> createState() => _ExpandableFaqState();
}

class _ExpandableFaqState extends State<ExpandableFaq>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> sizeFactor;
  late Animation<double> iconRotation;

  bool isExpanded = false;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    sizeFactor = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));

    iconRotation = Tween<double>(
      begin: 0.0,
      end: 0.5,
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
      appBar: AppBar(title: Text("Expandable FAQ")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  if (isExpanded) {
                    controller.reverse();
                  } else {
                    controller.forward();
                  }
                  isExpanded = !isExpanded;
                },
                child: Row(
                  mainAxisAlignment: .spaceBetween,
                  children: [
                    Text(
                      "Some guy's random question",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    RotationTransition(
                      turns: iconRotation,
                      child: Icon(Icons.keyboard_arrow_down_outlined),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              const Divider(thickness: 1.5),
              const SizedBox(height: 15),
              SizeTransition(
                sizeFactor: sizeFactor,
                child: Text(
                  "THIS IS SUCH A RANDOM TEXT BRO I KNOW\n" * 4,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    height: 1.5,
                  ),
                  textAlign: .justify,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "This is a testing text to check if slide interrupts other elements",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
