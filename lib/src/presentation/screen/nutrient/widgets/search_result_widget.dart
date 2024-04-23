import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/src/presentation/view_model/nutrient/nutrient_view_model.dart';

class SearchResultWidget extends ConsumerWidget {
  const SearchResultWidget({super.key});

  String _formatNumber(double number) {
    return number.toStringAsFixed(2); // 소수점 두 자리까지 표시 (셋째 자리에서 반올림)
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addList = ref.watch(nutrientController);
    if (addList.isEmpty) {
      return const Center(
          child: Text(
        "목록이 없습니다. 추가해주세요.",
        style: TextStyle(color: Colors.black),
      ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: ListView.builder(
          itemCount: addList.length,
          itemBuilder: (context, index) {
            final item = addList[index];

            return ListTile(
              title: Text(item.name),
              subtitle: Text(
                  "칼로리 : ${_formatNumber(item.kcal)}kcal / 탄수화물: ${_formatNumber(item.carbohydrate)}g \n단백질: ${_formatNumber(item.protein)}g / 지방: ${_formatNumber(item.fat)}g"),
              trailing: IconButton(
                onPressed: () {
                  ref
                      .read(nutrientController.notifier)
                      .removeNutrientList(item);
                  Fluttertoast.showToast(msg: "삭제되었습니다.");
                },
                icon: const Icon(Icons.remove),
              ),
            );
          }),
    );
  }
}

void showNutrientListBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (context) => const SearchResultWidget(),
  );
}
