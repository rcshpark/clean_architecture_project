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
  int currentPage = 1;
  bool isFetching = false;
  bool hasMoreData = true;
  List<NutrientModel> loadNutrients = [];
  NutrientRemoteViewModel(this._nutrientUseCase)
      : super(const RemoteNutrientInitial());
  Future<void> searchNutrient(String query, {bool loadMore = false}) async {
    if (isFetching || !hasMoreData) return;
    isFetching = true;

    if (!loadMore) {
      currentPage = 1;
      loadNutrients = [];
      hasMoreData = true;
    }

    state = loadMore ? state : const RemoteNutrientLoading();
    final response = await _nutrientUseCase.search(query, currentPage);
    response.when(success: (data) {
      if (data.isNotEmpty) {
        loadNutrients.addAll(data);
        currentPage++;
      }
      state = RemoteNutrientSuccess(loadNutrients);
      isFetching = false;
    }, error: ((error, message) {
      if (currentPage != 1) {
        state = RemoteNutrientSuccess(loadNutrients);
        hasMoreData = false;
      } else {
        state = RemoteNutrientError(message);
      }

      isFetching = false;

      print("error: $error");
      print("message: $message");
    }));
  }
}

final nutrientController =
    StateNotifierProvider<NutrientController, List<NutrientModel>>((ref) {
  return NutrientController();
});

class NutrientController extends StateNotifier<List<NutrientModel>> {
  NutrientController() : super([]);

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
