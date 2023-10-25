import 'package:auto_route/auto_route.dart';
import 'package:chilly/app/routing/router.gr.dart';

@AutoRouterConfig(
    generateForDir: ['lib/features'], replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: RootRoute.page,
          path: '/',
          children: [
            RedirectRoute(
              path: '',
              redirectTo: 'map',
            ),
            AutoRoute(
              page: TouchMapRoute.page,
              path: 'map',
            ),
            AutoRoute(
              page: ProfileRoute.page,
              path: 'profile',
            ),
          ],
        ),
      ];
}
