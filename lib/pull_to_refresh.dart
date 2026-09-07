import 'package:flutter/material.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({super.key});

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  List<Map<String, dynamic>> items = [];
  final List<String> images = [
    "assets/img.png",
    "assets/img_1.png",
    "assets/img_2.png",
    "assets/img_3.png",
  ];

  Future<void> handleRefresh() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      items.addAll([
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
      ]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pull to refresh")),
      body: SafeArea(
        child: Padding(
          padding: .all(20),
          child: RefreshIndicator(
            onRefresh: handleRefresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                height:
                    MediaQuery.of(context).size.height -
                    AppBar().preferredSize.height -
                    MediaQuery.of(context).padding.top,
                child: items.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: .center,
                          children: [
                            Text(
                              "There's nothing to see here. Pull to refresh",
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return Card(
                            margin: .only(bottom: 10),
                            child: Padding(
                              padding: .all(12),
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: .circular(10),
                                    child: Image.asset(
                                      item['media'][0],
                                      width: 130,
                                      height: 130,
                                      fit: .cover,
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: .start,
                                      children: [
                                        Text(
                                          "${item['name']}, ${item['age']}",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        Text(
                                          "${item['work']}, ${item['location']}",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: .w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
