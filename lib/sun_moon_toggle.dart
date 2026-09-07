import 'package:flutter/material.dart';

class SunMoonToggle extends StatefulWidget {
  const SunMoonToggle({super.key});

  @override
  State<SunMoonToggle> createState() => _SunMoonToggleState();
}

class _SunMoonToggleState extends State<SunMoonToggle> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Theme toggle")),
      body: GestureDetector(
        onTap: () {
          setState(() {
            isDark = !isDark;
          });
        },
        child: Stack(
          fit: .expand,
          children: [
            Positioned.fill(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                color: isDark ? Colors.black : Colors.white,
              ),
            ),

            AnimatedAlign(
              alignment: isDark ? .centerRight : .center,
              duration: const Duration(milliseconds: 500),
              child: AnimatedOpacity(
                opacity: isDark ? 0.0 : 1.0,
                duration: const Duration(milliseconds: 400),
                child: Icon(Icons.light_mode, size: 80),
              ),
            ),

            AnimatedAlign(
              alignment: isDark ? .center : .centerLeft,
              duration: const Duration(milliseconds: 500),
              child: AnimatedOpacity(
                opacity: isDark ? 1 : 0,
                duration: const Duration(milliseconds: 400),
                child: Icon(Icons.dark_mode, size: 80, color: Colors.white),
              ),
            ),

            // toggle
            AnimatedPositioned(
              left: isDark ? 200 : 100,
              top: 500,
              duration: const Duration(milliseconds: 500),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(shape: .circle, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
