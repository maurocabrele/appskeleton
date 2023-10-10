import 'package:appskeleton/data/data_provider/comment_list/comment_list_repository.dart';
import 'package:appskeleton/data/data_provider/local_storage/local_storage_repository.dart';
import 'package:appskeleton/data/data_provider/todo_list/todo_list_repository.dart';
import 'package:appskeleton/data/data_provider/user/login_repository.dart';
import 'package:appskeleton/data/data_provider/user/signup_repository.dart';
import 'package:appskeleton/data/repositories/comment_list/comment_list_repository_impl.dart';
import 'package:appskeleton/data/repositories/local_storage/local_storage_impl.dart';
import 'package:appskeleton/data/repositories/todo_list/todo_list_repository_impl.dart';
import 'package:appskeleton/data/repositories/user/login_repository_impl.dart';
import 'package:appskeleton/data/repositories/user/signup_repository_impl.dart';
import 'package:appskeleton/features/authentication/authentication_cubit.dart';
import 'package:appskeleton/presentation/pages/comment_page/comment_page_cubit.dart';
import 'package:appskeleton/presentation/pages/home_page/home_page_cubit.dart';
import 'package:appskeleton/presentation/pages/login/cubit/login_cubit.dart';
import 'package:appskeleton/presentation/pages/signup/cubit/signup_cubit.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

Future<void> init() async {
  final serviceLocator = GetIt.instance;

  ///API
  serviceLocator.registerLazySingleton<Dio>(() => _providerDio());

  ///REPOSITORIES

  /// LOCAL STORAGE ENC
  serviceLocator.registerLazySingleton<LocalStorageEncrypted>(
      () => LocalStorageEncryptedImpl());

  ///DATA-PROVIDER
  serviceLocator.registerLazySingleton<LogInRepository>(
      () => LogInRepositoryImpl(serviceLocator.get()));

  serviceLocator.registerLazySingleton<TodoListRepository>(
      () => TodoListRepositoryImpl(serviceLocator.get()));

  serviceLocator.registerLazySingleton<SignUpRepository>(
      () => SignUpRepositoryImpl(serviceLocator.get()));

  serviceLocator.registerLazySingleton<CommentListRepository>(
      () => CommentListRepositoryImpl(serviceLocator.get()));

  ///CUBIT
  serviceLocator.registerFactory(() =>
      LogInCubit(service: serviceLocator.get(), store: serviceLocator.get()));

  serviceLocator.registerFactory(() => HomePageCubit());

  serviceLocator.registerFactory(() => AuthenticationCubit());

  serviceLocator
      .registerFactory(() => SignUpCubit(signUp: serviceLocator.get()));

  serviceLocator.registerFactory(() => CommentPageCubit(serviceLocator.get()));
}

/// DIO
_providerDio() {
  final dio = Dio(
    BaseOptions(
      // "https://jsonplaceholder.typicode.com",
      baseUrl: dotenv.get("LOCAL_URL"),
      headers: {"Content-Type": "application/json"},
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) async {
// Add the access token to the request header
        options.headers['Authorization'] = 'Bearer your_access_token';
        return handler.next(options);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
// If a 401 response is received, refresh the access token
          String newAccessToken = await LogInRepositoryImpl(dio).refreshToken();

// Update the request header with the new access token
          e.requestOptions.headers['Authorization'] = 'Bearer $newAccessToken';

// Repeat the request with the updated header
          return handler.resolve(await dio.fetch(e.requestOptions));
        }
        return handler.next(e);
      },
    ),
  );
  return dio;
}
