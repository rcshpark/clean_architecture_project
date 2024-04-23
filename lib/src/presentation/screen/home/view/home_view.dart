import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("식단")),
        body: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.yellow,
                        child: const Center(
                            child: Text(
                          "아침",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.brown,
                        child: const Center(
                            child: Text(
                          "점심",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.brown,
                        child: const Center(
                            child: Text(
                          "저녁",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.brown,
                        child: const Center(
                            child: Text(
                          "간식",
                          style: TextStyle(fontSize: 16),
                        )),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "이런 식단은 어떠세요?",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Card(
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.blue,
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.blue,
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.blue,
                      ),
                    ),
                    Card(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.blue,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "오늘 하루 총정리",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
