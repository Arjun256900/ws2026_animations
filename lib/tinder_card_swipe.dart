import 'package:flutter/material.dart';

class TinderCardSwipe extends StatefulWidget {
  const TinderCardSwipe({super.key});

  @override
  State<TinderCardSwipe> createState() => _TinderCardSwipeState();
}

class _TinderCardSwipeState extends State<TinderCardSwipe>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> slideAnimation;

  ValueNotifier<Offset> offsetNotifier = ValueNotifier(Offset.zero);

  final List<String> images = [
    "assets/img.png",
    "assets/img_2.png",
    "assets/img_3.png",
  ];

  List<Map<String, dynamic>> cards = [];

  @override
  void initState() {
    super.initState();
    cards = [
      {
        "name": "Angelina Jolie",
        "age": "45",
        "work": "Actress",
        "location": "United Kingdom",
        "media": List.of(images)..shuffle(),
      },
      {
        "name": "Madison Beer",
        "age": "25",
        "work": "Singer/Songwriter",
        "location": "Nashville",
        "media": List.of(images)..shuffle(),
      },
      {
        "name": "Emma Watson",
        "age": "25",
        "work": "Actress",
        "location": "United Kingdom",
        "media": List.of(images)..shuffle(),
      },
      {
        "name": "Emma Meyers",
        "age": "23",
        "work": "Actress",
        "location": "Pakistan",
        "media": List.of(images)..shuffle(),
      },
    ]..shuffle();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    controller.addListener(() {
      offsetNotifier.value = slideAnimation.value;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cards.isEmpty) {
      return Scaffold(
        appBar: AppBar(title: const Text("Tinder card swipe")),
        body: const Center(child: Text("No more cards!")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Tinder card swipe")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: List.generate(cards.length, (index) {
                    final card = cards[index];
                    final List<String> cardImages = List<String>.from(
                      card['media'],
                    );

                    final isTopCard = index == cards.length - 1;

                    final cardUI = ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(cardImages[0], fit: BoxFit.cover),

                          DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withValues(alpha: 0.7),
                                ],
                                stops: const [0.6, 1.0],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 20,
                            left: 20,
                            right: 20,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${card['name']}, ${card['age']}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${card['work']} • ${card['location']}",
                                  style: const TextStyle(
                                    color: Colors.white70,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                    return GestureDetector(
                      onPanUpdate: controller.isAnimating
                          ? null
                          : (details) {
                              final current = offsetNotifier.value;
                              final newY = (current.dy + details.delta.dy)
                                  .clamp(-100, 0);
                              offsetNotifier.value = Offset(
                                current.dx + details.delta.dx,
                                newY.toDouble(),
                              );
                            },
                      onPanEnd: (details) {
                        const threshold = 160;
                        final currentOffset = offsetNotifier.value;
                        final dragOffset = currentOffset.dx;

                        if (dragOffset.abs() > threshold) {
                          slideAnimation =
                              Tween<Offset>(
                                begin: currentOffset,
                                end: Offset(
                                  dragOffset > 0 ? 700 : -700,
                                  currentOffset.dy,
                                ),
                              ).animate(
                                CurvedAnimation(
                                  parent: controller,
                                  curve: Curves.easeOut,
                                ),
                              );
                          controller.forward(from: 0).then((_) {
                            cards.removeLast();
                            offsetNotifier.value = Offset.zero;
                            setState(() {});
                          });
                        } else {
                          slideAnimation =
                              Tween<Offset>(
                                begin: currentOffset,
                                end: Offset.zero,
                              ).animate(
                                CurvedAnimation(
                                  parent: controller,
                                  curve: Curves.easeInOut,
                                ),
                              );
                          controller.forward(from: 0);
                        }
                      },
                      child: AnimatedBuilder(
                        animation: offsetNotifier,
                        child: cardUI,
                        builder: (context, child) {
                          final offset = offsetNotifier.value;
                          final angle = offset.dx / 400;
                          if (isTopCard) {
                            return Transform.translate(
                              offset: offset,
                              child: Transform.rotate(
                                angle: angle,
                                child: child,
                              ),
                            );
                          } else {
                            final dragPercent = (offset.dx.abs() / 160).clamp(
                              0,
                              1,
                            );
                            final scale = 0.92 + (0.05 * dragPercent);
                            return Transform.scale(scale: scale, child: child);
                          }
                        },
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
