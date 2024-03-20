import 'package:freezed_annotation/freezed_annotation.dart';

part 'data_state_model.freezed.dart';

@freezed
class DataState<T> with _$DataState<T> {
  const factory DataState.success(T data) = DataStateSuccess;

  const factory DataState.error(
    Exception error,
    String message,
  ) = DataStateError;
}
