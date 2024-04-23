import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/presentation/view_model/nutrient/nutrient_view_model.dart';

class NutrientDetailScreen extends ConsumerStatefulWidget {
  final NutrientModel nutrientModel;
  const NutrientDetailScreen({required this.nutrientModel, super.key});

  @override
  ConsumerState<NutrientDetailScreen> createState() =>
      _NutrientDetailScreenConsumerState();
}

class _NutrientDetailScreenConsumerState
    extends ConsumerState<NutrientDetailScreen> {
  late TextEditingController weightTextController;
  double weightMultiplier = 1.0;

  NutrientModel updateWithMultiplier(double multiplier) {
    return NutrientModel(
        name: widget.nutrientModel.name,
        weight: widget.nutrientModel.weight * multiplier,
        kcal: widget.nutrientModel.kcal * multiplier,
        carbohydrate: widget.nutrientModel.carbohydrate * multiplier,
        protein: widget.nutrientModel.protein * multiplier,
        fat: widget.nutrientModel.fat * multiplier,
        na: widget.nutrientModel.na * multiplier,
        col: widget.nutrientModel.col * multiplier,
        sugars: widget.nutrientModel.sugars * multiplier,
        transFat: widget.nutrientModel.transFat * multiplier,
        saturatedFat: widget.nutrientModel.saturatedFat * multiplier,
        company: widget.nutrientModel.company);
  }

  @override
  void initState() {
    super.initState();
    weightTextController =
        TextEditingController(text: widget.nutrientModel.weight.toString());
    weightTextController.addListener(_updateMultiplier);
  }

  void _updateMultiplier() {
    double newWeight = double.tryParse(weightTextController.text) ??
        widget.nutrientModel.weight;
    setState(() {
      weightMultiplier = newWeight / widget.nutrientModel.weight;
    });
  }

  @override
  void dispose() {
    weightTextController.removeListener(_updateMultiplier);
    weightTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
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
                  widget.nutrientModel.name,
                  style: const TextStyle(fontSize: 18),
                ),
                Row(
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: TextField(
                            maxLength: 4,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 18),
                            controller: weightTextController,
                            onChanged: (value) {
                              weightTextController.text = value;
                            },
                            decoration: const InputDecoration(
                                counterText: "",
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.grey,
                                )),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.grey,
                                ))))),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text("g", style: TextStyle(fontSize: 18)),
                  ],
                ),
                const Divider(),
                ..._buildNutrientList(),
                ElevatedButton(
                    onPressed: () {
                      if (ref
                          .read(nutrientController)
                          .contains(updateWithMultiplier(weightMultiplier))) {
                        Fluttertoast.showToast(msg: "이미 추가된 항목입니다!");
                        return;
                      }
                      ref.read(nutrientController.notifier).addNutrientList(
                          updateWithMultiplier(weightMultiplier));
                      Fluttertoast.showToast(msg: "추가가 완료 되었습니다!");
                    },
                    child: const Text("추가"))
              ],
            ),
          )),
    );
  }

  List<Widget> _buildNutrientList() {
    return [
      Text(
          "칼로리: ${_formatNumber(widget.nutrientModel.kcal * weightMultiplier)}kcal",
          style: const TextStyle(fontSize: 14)),
      Text(
          "탄수화물: ${_formatNumber(widget.nutrientModel.carbohydrate * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text(
          "단백질: ${_formatNumber(widget.nutrientModel.protein * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text("지방: ${_formatNumber(widget.nutrientModel.fat * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text("나트륨: ${_formatNumber(widget.nutrientModel.na * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text(
          "콜레스테롤: ${_formatNumber(widget.nutrientModel.col * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text(
          "당: ${_formatNumber(widget.nutrientModel.sugars * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text(
          "트랜스지방산: ${_formatNumber(widget.nutrientModel.transFat * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
      Text(
          "산화지방산: ${_formatNumber(widget.nutrientModel.saturatedFat * weightMultiplier)}g",
          style: const TextStyle(fontSize: 14)),
    ];
  }

  String _formatNumber(double number) {
    return number.toStringAsFixed(2); // 소수점 두 자리까지 표시 (셋째 자리에서 반올림)
  }
}
