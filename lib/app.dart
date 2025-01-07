import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:to_do_app/core/presentation/themes/app_theme.dart';
import 'package:to_do_app/core/presentation/utils/generated/translation/translations.dart';
import 'package:to_do_app/core/presentation/utils/routes/route_info.dart';
import 'package:to_do_app/core/presentation/utils/routes/router.dart';
import 'package:to_do_app/home/presentation/pages/home_page.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp.router(
      locale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: Translations.localizationsDelegates,
      supportedLocales: Translations.supportedLocales,
      theme: Theme.of(context).appTheme(Brightness.light).getThemeData(context),
      themeMode: ThemeMode.light,
      routerConfig: _goRouterConfig,
    );
  }
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter _goRouterConfig = GoRouter(
  initialLocation: HomePage.path,
  navigatorKey: _rootNavigatorKey,
  routes: _getRoutes(Routes.I.routes),
);

List<RouteBase> _getRoutes(List<RouteInfo>? routes) => (routes ?? [])
    .map(
      (subRoute) => GoRoute(
        path: subRoute.path,
        builder: (context, state) => subRoute.builder(context, state),
        routes: _getRoutes(subRoute.routes),
      ),
    )
    .toList();
