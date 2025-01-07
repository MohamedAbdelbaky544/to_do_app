import 'package:to_do_app/core/presentation/utils/routes/route_info.dart';
import 'package:to_do_app/home/presentation/pages/home_page.dart';

class Routes {
  Routes._();
  static Routes I = Routes._();

  final routes = [
    RouteInfo(
      path: HomePage.path,
      builder: (context, state) => const HomePage(),
    )
  ];
}
