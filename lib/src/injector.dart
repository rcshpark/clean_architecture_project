import 'package:get_it/get_it.dart';
import 'package:health_care/src/data/data_sources/auth_data_source.dart';
import 'package:health_care/src/data/repository/auth_repository_impl.dart';
import 'package:health_care/src/domain/repository/auth_repository.dart';
import 'package:health_care/src/domain/usecase/auth_usecase.dart';

final getIt = GetIt.instance;

void setupInjector() {
  getIt.registerLazySingleton<AuthDataSource>(() => AuthDataSource());
  getIt
      .registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt()));
  getIt.registerLazySingleton<AuthUseCase>(() => AuthUseCase(getIt()));
}
