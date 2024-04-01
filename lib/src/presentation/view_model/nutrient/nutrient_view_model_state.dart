part of 'nutrient_view_model.dart';

abstract class RemoteNutrientState {
  final List<NutrientModel>? nutrients;
  final String? error;
  const RemoteNutrientState({this.nutrients, this.error});
}

class RemoteNutrientInitial extends RemoteNutrientState {
  const RemoteNutrientInitial();
}

class RemoteNutrientLoading extends RemoteNutrientState {
  const RemoteNutrientLoading();
}

class RemoteNutrientSuccess extends RemoteNutrientState {
  final List<NutrientModel> nutrients;

  RemoteNutrientSuccess(this.nutrients);
}

class RemoteNutrientError extends RemoteNutrientState {
  final String message;

  RemoteNutrientError(this.message);
}
