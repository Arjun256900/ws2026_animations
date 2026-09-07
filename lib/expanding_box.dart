import 'package:flutter/material.dart';

class ExpandingBox extends StatefulWidget {
  const ExpandingBox({super.key});

  @override
  State<ExpandingBox> createState() => _ExpandingBoxState();
}

class _ExpandingBoxState extends State<ExpandingBox> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expanding Box")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                GestureDetector(
                  onTap: () => setState(() {
                    isExpanded = !isExpanded;
                  }),
                  child: AnimatedContainer(
                    width: isExpanded ? 250 : 100,
                    height: isExpanded ? 150 : 100,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: .circular(isExpanded ? 40 : 0),
                      color: isExpanded ? Colors.red : Colors.blue,
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
