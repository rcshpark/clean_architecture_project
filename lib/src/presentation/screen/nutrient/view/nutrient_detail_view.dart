import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/presentation/view_model/nutrient/nutrient_view_model.dart';

class NutrientDetailScreen extends ConsumerWidget {
  final NutrientModel nutrientModel;
  const NutrientDetailScreen({required this.nutrientModel, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("상세정보"),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nutrientModel.name,
                style: const TextStyle(fontSize: 18),
              ),
              Text("1회 제공량:${nutrientModel.weight}g",
                  style: const TextStyle(fontSize: 18)),
              const Divider(),
              const Text(
                "영양 성분표",
                style: TextStyle(fontSize: 18),
              ),
              Text("칼로리: ${nutrientModel.kcal}kcal",
                  style: const TextStyle(fontSize: 14)),
              Text("탄수화물: ${nutrientModel.carbohydrate}g",
                  style: const TextStyle(fontSize: 14)),
              Text("단백질: ${nutrientModel.protein}g",
                  style: const TextStyle(fontSize: 14)),
              Text("지방: ${nutrientModel.fat}g",
                  style: const TextStyle(fontSize: 14)),
              Text("나트륨: ${nutrientModel.na}g",
                  style: const TextStyle(fontSize: 14)),
              Text("콜레스테롤: ${nutrientModel.col}g",
                  style: const TextStyle(fontSize: 14)),
              Text("당: ${nutrientModel.sugars}g",
                  style: const TextStyle(fontSize: 14)),
              Text("트랜스지방산: ${nutrientModel.transFat}g",
                  style: const TextStyle(fontSize: 14)),
              Text("산화지방산: ${nutrientModel.saturatedFat}g",
                  style: const TextStyle(fontSize: 14)),
              ElevatedButton(
                  onPressed: () {
                    if (ref
                        .read(addNutrientViewModel)
                        .contains(nutrientModel)) {
                      Fluttertoast.showToast(msg: "이미 추가된 항목입니다!");
                      return;
                    }
                    ref
                        .read(addNutrientViewModel.notifier)
                        .addNutrientList(nutrientModel);
                  },
                  child: const Text("추가"))
            ],
          ),
        ));
  }
}
