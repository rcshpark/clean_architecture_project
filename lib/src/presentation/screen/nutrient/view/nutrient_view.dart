import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health_care/src/presentation/screen/nutrient/view/nutrient_search_view.dart';

class NutrientScreen extends ConsumerWidget {
  const NutrientScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(title: const Text("식단")),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NutrientSearchScreen()));
              },
              child: const ListTile(
                title: Text('아침 식단'),
                trailing: Icon(Icons.add),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                title: Text('점심 식단'),
                trailing: Icon(Icons.add),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                title: Text('저녁 식단'),
                trailing: Icon(Icons.add),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: const ListTile(
                title: Text('기타'),
                trailing: Icon(Icons.add),
              ),
            )
          ],
        ));
  }
}
