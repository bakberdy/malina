import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:malina/core/core.dart';
import 'package:malina/ui/widgets/category_bar.dart';
import 'package:malina/ui/widgets/information_banner.dart';
import 'package:malina/ui/widgets/qr_code_banner.dart';
import 'package:malina/ui/widgets/search_bar.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    CustomSearchBar(),
                    SizedBox(height: 12),
                    QRCodeBanner(onTap: () {}),
                    SizedBox(height: 15),
                    InformationBanner(
                      title: 'Еда',
                      description: 'Из кафе и \nресторанов',
                      bgImage: foodBoxImage,
                      bgColor: AppColors.foodCard,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    InformationBanner(
                      title: 'Бьюти',
                      description: 'Салоны красоты \nи товары',
                      bgImage: beautyBoxImage,
                      bgColor: AppColors.beautyCard,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: CategoryBar(),
              )
            ],
          ),
        ));
  }
}
