import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/person/data/datasources/person_local_data_source.dart';
import 'features/person/data/datasources/person_remote_data_source.dart';
import 'features/person/data/repositories/person_repository_impl.dart';
import 'features/person/domain/repositories/person_repository.dart';
import 'features/person/domain/usecases/get_random_person.dart';
import 'features/person/presentation/bloc/person/person_bloc.dart';

// service locator
final sl = GetIt.instance;

void init() {
  // Features - Person
  //    Bloc
  sl.registerFactory(() => PersonBloc(random: sl()));

  //    Usecases
  sl.registerLazySingleton(() => GetRandomPerson(sl()));

  //    Repositories
  sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl(
      remoteDataSource: sl(), localDataSource: sl(), networkInfo: sl()));

  //    Data Sources
  sl.registerLazySingleton<PersonLocalDataSource>(
      () => PersonLocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<PersonRemoteDataSource>(
      () => PersonRemoteDataSourceImpl(dio: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingletonAsync(
      () async => await SharedPreferences.getInstance());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
