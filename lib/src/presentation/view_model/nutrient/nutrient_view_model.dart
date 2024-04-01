import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:health_care/src/domain/model/nutrient_model.dart';
import 'package:health_care/src/domain/usecase/nutrient_usecase.dart';

part 'nutrient_view_model_state.dart';

final RemoteNutrientUseCase _nutrientUseCase = GetIt.I<RemoteNutrientUseCase>();
final nutrientRemoteProvider =
    StateNotifierProvider<NutrientRemoteViewModel, RemoteNutrientState>(
        (ref) => NutrientRemoteViewModel(_nutrientUseCase));

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
