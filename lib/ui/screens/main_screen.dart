import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:malina/core/route/app_router.gr.dart';
import 'package:malina/ui/widgets/custom_bottom_navigation_bar.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        HomeRoute(),
        FavoriteRoute(),
        ProfileRoute(),
        FoodCartRoute(),
        ProductCartRoute()
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(child: child),
          bottomNavigationBar: CustomBottomNavigationBar(
            onItemTapped: (val) {
              tabsRouter.setActiveIndex(val);
            },
            currentIndex: tabsRouter.activeIndex,
            onQrItemTapped: () {
              context.router.push(QrScanRoute());
            },
          ),
        );
      },
    );
  }
}

// return SafeArea(
//       child: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
//         builder: (context, state) {
//           return Scaffold(
//               body: pages[state.pageIndex],
//               bottomNavigationBar: CustomBottomNavigationBar(
//                 onItemTapped: (int value) {
//                   context.read<BottomNavigationCubit>().changeTab(value);
//                 },
//                 currentIndex: state.pageIndex,
//               ));
//         },
//       ),
//     );
//   }

// BottomNavigationBar(
//                 showSelectedLabels: false,
//                 showUnselectedLabels: false,
//                 items: [
//                   BottomNavigationBarItem(
//                       icon: SvgPicture.asset(lentaIcon), label: 'Лента'),
//                   BottomNavigationBarItem(
//                       icon: SvgPicture.asset(favoriteIcon), label: 'Избранное'),
//                   BottomNavigationBarItem(
//                       icon: SvgPicture.asset(qrIcon), label: 'Кюар'),
//                   BottomNavigationBarItem(
//                       icon: SvgPicture.asset(profileIcon), label: 'Профиль'),
//                   BottomNavigationBarItem(
//                       icon: SvgPicture.asset(cartIcon), label: 'Корзина'),
//                 ],
//               ),
