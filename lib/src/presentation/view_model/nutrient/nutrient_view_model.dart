import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/usecase/nutrient_usecase.dart';

part 'nutrient_view_model_state.dart';

final nutreintViewModel =
    StateNotifierProvider<NutrientRemoteViewModel, RemoteNutrientState>((ref) {
  final nutrientUsecase = ref.watch(nutrientUseCaseProvider);
  return NutrientRemoteViewModel(nutrientUsecase);
});

class NutrientRemoteViewModel extends StateNotifier<RemoteNutrientState> {
  final RemoteNutrientUseCase _nutrientUseCase;
  NutrientRemoteViewModel(this._nutrientUseCase)
      : super(const RemoteNutrientInitial());
  Future<void> searchNutrient(String query) async {
    state = const RemoteNutrientLoading();
    final response = await _nutrientUseCase.search(query);
    response.when(success: (data) {
      state = RemoteNutrientSuccess(data);
    }, error: ((error, message) {
      RemoteNutrientError(message);
      print("error: $error");
      print("message: $message");
    }));
  }

  test() {}
}

final addNutrientViewModel =
    StateNotifierProvider<AddNutrientViewModel, List<NutrientModel>>((ref) {
  return AddNutrientViewModel();
});

class AddNutrientViewModel extends StateNotifier<List<NutrientModel>> {
  AddNutrientViewModel() : super([]);

  addNutrientList(NutrientModel nutrientModel) {
    state = [...state, nutrientModel];
  }

  removeNutrientList(NutrientModel nutrientModel) {
    state = state.where((item) => item != nutrientModel).toList();
  }

  saveNutrientList(String type, List<NutrientModel> nutrientList) {
    // save db
  }
  double calculateTotalKcal() {
    double totalKcal = 0;
    for (var item in state) {
      totalKcal += double.parse(item.kcal.toString());
    }
    return totalKcal;
  }
}
