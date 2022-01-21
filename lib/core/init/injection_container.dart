import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_series_application/core/_core_exports.dart';
import 'package:movie_series_application/feature/home/viewmodel/_viewmodel_exports.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  //! External

  //? Dio Client
  serviceLocator.registerLazySingleton(() => Dio());

  //! Core

  //? Remote Data Source
  //* Repo
  serviceLocator.registerLazySingleton<BaseRequestRepository>(() => MainRequestImpl(serviceLocator()));

  serviceLocator.registerLazySingleton(() => MainBaseGet(serviceLocator()));
  serviceLocator.registerLazySingleton(() => MainBasePost(serviceLocator()));

  //!Future

  //? Home

  serviceLocator.registerLazySingleton<HomeProvider>(() => HomeProvider());
}