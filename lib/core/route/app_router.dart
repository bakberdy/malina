import 'package:auto_route/auto_route.dart';
import 'package:malina/core/route/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, path: '/', initial: true, children: [
          AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
          AutoRoute(page: FavoriteRoute.page, path: 'favorite',),
          AutoRoute(page: ProfileRoute.page, path: 'profile',),
          AutoRoute(page: FoodCartRoute.page, path: 'food_cart',),
          AutoRoute(page: ProductCartRoute.page, path: 'product_cart',),
        ]),
        AutoRoute(page: QrScanRoute.page, path: '/qr_scan', fullscreenDialog: true)
      ];
}
