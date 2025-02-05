// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:malina/ui/screens/favorite_screen.dart' as _i1;
import 'package:malina/ui/screens/food_cart_screen.dart' as _i2;
import 'package:malina/ui/screens/home_screen.dart' as _i3;
import 'package:malina/ui/screens/main_screen.dart' as _i4;
import 'package:malina/ui/screens/product_cart_screen.dart' as _i5;
import 'package:malina/ui/screens/profile_screen.dart' as _i6;
import 'package:malina/ui/screens/qr_scan_screen.dart' as _i7;

/// generated route for
/// [_i1.FavoriteScreen]
class FavoriteRoute extends _i8.PageRouteInfo<void> {
  const FavoriteRoute({List<_i8.PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i2.FoodCartScreen]
class FoodCartRoute extends _i8.PageRouteInfo<FoodCartRouteArgs> {
  FoodCartRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        FoodCartRoute.name,
        args: FoodCartRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'FoodCartRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FoodCartRouteArgs>(
        orElse: () => const FoodCartRouteArgs(),
      );
      return _i2.FoodCartScreen(key: args.key);
    },
  );
}

class FoodCartRouteArgs {
  const FoodCartRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'FoodCartRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.MainScreen();
    },
  );
}

/// generated route for
/// [_i5.ProductCartScreen]
class ProductCartRoute extends _i8.PageRouteInfo<void> {
  const ProductCartRoute({List<_i8.PageRouteInfo>? children})
    : super(ProductCartRoute.name, initialChildren: children);

  static const String name = 'ProductCartRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.ProductCartScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.QrScanScreen]
class QrScanRoute extends _i8.PageRouteInfo<void> {
  const QrScanRoute({List<_i8.PageRouteInfo>? children})
    : super(QrScanRoute.name, initialChildren: children);

  static const String name = 'QrScanRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.QrScanScreen();
    },
  );
}
