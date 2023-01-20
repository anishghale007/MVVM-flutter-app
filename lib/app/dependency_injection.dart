import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_udemy/app/app_prefs.dart';
import 'package:flutter_udemy/data/data_source/remote_date_source.dart';
import 'package:flutter_udemy/data/network/app_api.dart';
import 'package:flutter_udemy/data/network/dio_factory.dart';
import 'package:flutter_udemy/data/network/network_info.dart';
import 'package:flutter_udemy/data/repository/repository_impl.dart';
import 'package:flutter_udemy/domain/repository/repository.dart';
import 'package:flutter_udemy/domain/usecase/login_usecase.dart';
import 'package:flutter_udemy/presentation/login/login_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  // shared prefs instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance())); // (this.sharedPreferences)

  // network info
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(
      DataConnectionChecker())); // abstract NetworkIno, NetworkInfoImpl implements NetworkInfo(this.dataConnectionChecker)

  // register dio factory
  instance.registerLazySingleton<DioFactory>(
      () => DioFactory(instance())); // (this.appPreferences)

  // app service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance())); // (this.appServiceClient)

  // repository
  instance.registerLazySingleton<Repository>(() => RepositoryImpl(
      instance(), instance())); // (this.remoteDataSource, this.networkInfO)
}

initLoginModule() {
  // if any instance of LoginUseCase is not registered, it will initialize the following
  if(!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}
