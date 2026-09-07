import 'package:chatgpt_level_1/animated_gradient.dart';
import 'package:chatgpt_level_1/animated_login_screen.dart';
import 'package:chatgpt_level_1/animated_progress_ring.dart';
import 'package:chatgpt_level_1/bouncing_ball.dart';
import 'package:chatgpt_level_1/card_flip.dart';
import 'package:chatgpt_level_1/expandable_faq.dart';
import 'package:chatgpt_level_1/expanding_box.dart';
import 'package:chatgpt_level_1/floating_action_menu.dart';
import 'package:chatgpt_level_1/hero_gallery.dart';
import 'package:chatgpt_level_1/like_button.dart';
import 'package:chatgpt_level_1/loading_dots.dart';
import 'package:chatgpt_level_1/page_transition_practice.dart';
import 'package:chatgpt_level_1/pull_to_refresh.dart';
import 'package:chatgpt_level_1/pulse_animation_japan.dart';
import 'package:chatgpt_level_1/pulsing_notification_dot.dart';
import 'package:chatgpt_level_1/shader_mask_practice.dart';
import 'package:chatgpt_level_1/shimmer_loading.dart';
import 'package:chatgpt_level_1/sun_moon_toggle.dart';
import 'package:chatgpt_level_1/tinder_card_swipe.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: Scrollbar(
            controller: controller,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  spacing: 20,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ExpandingBox(),
                          ),
                        );
                      },
                      child: Text("Expanding box"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PulsingNotificationDot(),
                          ),
                        );
                      },
                      child: Text("Pulsing notification dot"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SunMoonToggle(),
                          ),
                        );
                      },
                      child: Text("Theme Toggle"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LikeButton()),
                        );
                      },
                      child: Text("Like button"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnimatedProgressRing(),
                          ),
                        );
                      },
                      child: Text("Animated progress ring"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CardFlip()),
                        );
                      },
                      child: Text("Card flip"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ExpandableFaq(),
                          ),
                        );
                      },
                      child: Text("Expandable FAQ"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FloatingActionMenu(),
                          ),
                        );
                      },
                      child: Text("Floating action menu"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TinderCardSwipe(),
                          ),
                        );
                      },
                      child: Text("Tinder card swipe"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => LoadingDots(),
                          ),
                        );
                      },
                      child: Text("Loading dots"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => HeroGallery(),
                          ),
                        );
                      },
                      child: Text("Hero Gallery"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnimatedLoginScreen(),
                          ),
                        );
                      },
                      child: Text("Animated Login Screen"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PullToRefresh(),
                          ),
                        );
                      },
                      child: Text("Pull to refresh"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PulseAnimationJapan(),
                          ),
                        );
                      },
                      child: Text("Pulse animation Japan"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShaderMaskPractice(),
                          ),
                        );
                      },
                      child: Text('Shader Mask'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => AnimatedGradient(),
                          ),
                        );
                      },
                      child: Text("Animated Gradient"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ShimmerLoading(),
                          ),
                        );
                      },
                      child: Text("Shimmer Loading"),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, _, _) => PageTransitionPractice(),
                            transitionsBuilder:
                                (context, anim, secondAnim, child) {
                                  final position =
                                      Tween<Offset>(
                                        begin: Offset(0, 1),
                                        end: .zero,
                                      ).animate(
                                        CurvedAnimation(
                                          parent: anim,
                                          curve: Curves.easeOut,
                                        ),
                                      );
                                  return SlideTransition(
                                    position: position,
                                    child: child,
                                  );
                                },
                          ),
                        );
                      },
                      child: Text("Page Transition Practice"),
                    ),

                    // todo
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
