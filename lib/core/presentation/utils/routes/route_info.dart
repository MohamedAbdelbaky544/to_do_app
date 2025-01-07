import 'package:go_router/go_router.dart';

class RouteInfo {
  final String path;
  final GoRouterWidgetBuilder builder;
  final String? name;

  final List<RouteInfo>? routes;
  const RouteInfo({
    required this.path,
    required this.builder,
    this.name,
    this.routes,
  });
}
