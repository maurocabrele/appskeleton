import 'package:appskeleton/data/datasources/remoteDataSources/constants/remote_const.dart';
import 'package:appskeleton/data/datasources/remoteDataSources/remoteDataSources.dart';
import 'package:appskeleton/data/repositories/home_page_repository_impl.dart';
import 'package:appskeleton/domain/repositories/home_page_repository.dart';
import 'package:appskeleton/presentation/pages/homepage/home_page_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  final serviceLocator = GetIt.instance;

  ///API
  serviceLocator.registerLazySingleton<Dio>(() => _provideDio(url));

  ///DATASOURCES
  serviceLocator.registerLazySingleton<RemoteDataSources>(
      () => RemoteDataSourcesImpl(serviceLocator.get()));

  ///REPOSITORIES
  serviceLocator.registerLazySingleton<HomePageRepository>(
      () => HomePageRepositoryImpl(serviceLocator.get()));

  ///CUBIT
  serviceLocator.registerFactory(() => HomePageCubit(serviceLocator.get()));
}

_provideDio(String baseUrl) {
  final dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  return dio;
}
