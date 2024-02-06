// injection.dart
import 'package:currency_converter_app/common/di/di.config.dart';
// ignore: depend_on_referenced_packages
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
GetIt configureDependencies() => getIt.init();
