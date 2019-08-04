import 'package:flutter_dialog_manager/services/dialg_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => DialogService());
}
