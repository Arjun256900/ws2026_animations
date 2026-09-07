import 'package:flutter/material.dart';

class AnimatedLoginScreen extends StatefulWidget {
  const AnimatedLoginScreen({super.key});

  @override
  State<AnimatedLoginScreen> createState() => _AnimatedLoginScreenState();
}

class _AnimatedLoginScreenState extends State<AnimatedLoginScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> logoSlide;
  late Animation<double> cardFade;
  late Animation<Offset> usernameSlide;
  late Animation<double> usernameOpacity;
  late Animation<Offset> passSlide;
  late Animation<double> passOpacity;
  late Animation<Offset> buttonSlide;
  late Animation<double> buttonOpacity;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );

    logoSlide = Tween<Offset>(begin: Offset(0, -1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0, 0.2, curve: Curves.easeOut),
      ),
    );

    cardFade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.25, 0.5, curve: Curves.easeOut),
      ),
    );

    usernameSlide = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(0.55, 0.7, curve: Curves.easeOut),
          ),
        );

    usernameOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.55, 0.7, curve: Curves.easeOut),
      ),
    );

    passSlide = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.65, 0.8, curve: Curves.easeOut),
      ),
    );

    passOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.65, 0.8, curve: Curves.easeOut),
      ),
    );

    buttonSlide = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 0.9, curve: Curves.easeOut),
      ),
    );

    buttonOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.75, 0.9, curve: Curves.easeOut),
      ),
    );

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text("Animated Login Screen"),
        backgroundColor: Color(0xFFF5F5F5),
      ),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SlideTransition(
                    position: logoSlide,
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/img_2.png"),
                    ),
                  ),
                  const SizedBox(height: 20),
                  FadeTransition(
                    opacity: cardFade,
                    child: Container(
                      margin: .only(bottom: 20),
                      padding: .symmetric(horizontal: 15, vertical: 25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: .circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              "Instagram",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontStyle: .italic,
                              ),
                            ),
                            const SizedBox(height: 15),
                            FadeTransition(
                              opacity: usernameOpacity,
                              child: SlideTransition(
                                position: usernameSlide,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFD9D9D9),
                                    border: OutlineInputBorder(
                                      borderSide: .none,
                                      borderRadius: .circular(10),
                                    ),
                                    hintText: "Username",
                                    prefixIcon: Icon(Icons.person_outline),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            FadeTransition(
                              opacity: passOpacity,
                              child: SlideTransition(
                                position: passSlide,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Color(0xFFD9D9D9),
                                    border: OutlineInputBorder(
                                      borderSide: .none,
                                      borderRadius: .circular(10),
                                    ),
                                    hintText: "Password",
                                    prefixIcon: Icon(Icons.lock_outline),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            FadeTransition(
                              opacity: buttonOpacity,
                              child: SlideTransition(
                                position: buttonSlide,
                                child: SizedBox(
                                  width: .infinity,
                                  height: 45,
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black87,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: .circular(10),
                                      ),
                                    ),
                                    icon: Icon(
                                      Icons.arrow_forward_outlined,
                                      weight: 10,
                                    ),
                                    iconAlignment: .end,
                                    label: Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blueAccent,
                    ),
                    child: Text("Don't have an account? Register instead"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
