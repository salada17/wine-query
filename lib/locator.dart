import 'package:get_it/get_it.dart';
import 'package:winequery/core/model/location.dart';

import 'core/service/api.dart';
import 'core/service/auth.service.dart';
import 'viewmodel/auth.vm.dart';
import 'viewmodel/main.vm.dart';
import 'viewmodel/purchase.vm.dart';
import 'viewmodel/store.vm.dart';
import 'viewmodel/wine.vm.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => Coords());

  locator.registerFactory(() => AuthModel());
  locator.registerFactory(() => MainModel());
  // locator.registerFactory(() => PurchaseModel());
  // locator.registerFactory(() => StoreModel());
  // locator.registerFactory(() => WineModel());
}
