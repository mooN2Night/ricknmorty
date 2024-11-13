import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rick_and_morty/core/platform/network_info.dart';
import 'package:rick_and_morty/feature/data/data_sources/person_local_data_source.dart';
import 'package:rick_and_morty/feature/data/data_sources/person_remote_data_source.dart';
import 'package:rick_and_morty/feature/data/mapper/mapper.dart';
import 'package:rick_and_morty/feature/data/repositories_impl/person_repository_impl.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_person.dart';
import 'package:rick_and_morty/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///State Managers
  sl.registerFactory(() => PersonListCubit(getAllPersonsUseCase: sl()));

  sl.registerFactory(() => PersonSearchBloc(searchPersonsUseCase: sl()));

  ///UseCases
  sl.registerLazySingleton(() => GetAllPersonsUseCase(sl()));

  sl.registerLazySingleton(() => SearchPersonUseCase(sl()));

  ///Repository
  sl.registerLazySingleton<PersonRepository>(
    () => PersonRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
      mapper: sl(),
    ),
  );

  sl.registerLazySingleton<PersonLocalDataSource>(
    () => PersonLocalDataSourceImpl(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<PersonRemoteDataSource>(
    () => PersonRemoteDataSourceImpl(dio: sl()),
  );

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  sl.registerLazySingleton(() => Mapper());

  ///External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => InternetConnection());
}
