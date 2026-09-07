import 'package:chatgpt_level_1/dummy_screens/page_1.dart';
import 'package:flutter/material.dart';

class PageTransitionPractice extends StatefulWidget {
  const PageTransitionPractice({super.key});

  @override
  State<PageTransitionPractice> createState() => _PageTransitionPracticeState();
}

class _PageTransitionPracticeState extends State<PageTransitionPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Page Transition practice")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (_, _, _) => Page1(),
                        transitionDuration: const Duration(milliseconds: 800),
                        transitionsBuilder:
                            (context, animation, secondAnim, child) {
                              return FadeTransition(
                                opacity: Tween<double>(
                                  begin: 1,
                                  end: 0,
                                ).animate(secondAnim),
                                child: SlideTransition(
                                  position: Tween<Offset>(
                                    begin: .zero,
                                    end: Offset(-1, 0),
                                  ).animate(secondAnim),
                                  child: FadeTransition(
                                    opacity: animation,
                                    child: SlideTransition(
                                      position: Tween<Offset>(
                                        begin: Offset(1, -1),
                                        end: .zero,
                                      ).animate(animation),
                                      child: ScaleTransition(
                                        scale: Tween<double>(
                                          begin: 0.5,
                                          end: 1,
                                        ).animate(animation),
                                        child: child,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                      ),
                    );
                  },
                  child: Text("Go to page 1"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
