import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:to_do_app/injection.config.dart';

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async {
  await GetItInjectableX(getIt).init();
}
