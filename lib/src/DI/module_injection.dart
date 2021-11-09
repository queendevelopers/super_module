// configure injectable in feature module
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'module_injection.config.dart';

@InjectableInit(initializerName: r'$initModuleGetIt')
void configureModuleDependencies(GetIt getIt) async => $initModuleGetIt(getIt);
