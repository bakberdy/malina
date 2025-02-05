import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:malina/core/core.dart';
import 'package:malina/core/models/product_model.dart';
import 'package:malina/ui/widgets/cart_listview.dart';
import 'package:malina/ui/widgets/custom_app_bar.dart';
import 'package:malina/ui/widgets/select_food_status.dart';

@RoutePage()
class FoodCartScreen extends StatelessWidget {
  FoodCartScreen({super.key});

  final products = [
    ProductModel(
        category: 'Bellagio Coffee',
        name: 'Том ям',
        description: 'Пицца с соусом том ям 230 гр',
        price: 250,
        pictureUrl:
            'https://th.bing.com/th/id/R.6025cd217f7bd62c40859c33e3a01c03?rik=IFaOVth3KQAn6A&riu=http%3a%2f%2fpngimg.com%2fuploads%2fpizza%2fpizza_PNG7151.png&ehk=3DdwUhkb8np6LcabfaOep%2fLzLk19VXmGTmaZbJcfSE0%3d&risl=&pid=ImgRaw&r=0'),
  ProductModel(
        category: 'Bellagio Coffee',
        name: 'Том ям 2',
        description: 'Пицца с соусом том ям 230 гр',
        price: 250,
        pictureUrl:
            'https://th.bing.com/th/id/R.6025cd217f7bd62c40859c33e3a01c03?rik=IFaOVth3KQAn6A&riu=http%3a%2f%2fpngimg.com%2fuploads%2fpizza%2fpizza_PNG7151.png&ehk=3DdwUhkb8np6LcabfaOep%2fLzLk19VXmGTmaZbJcfSE0%3d&risl=&pid=ImgRaw&r=0'),
  ProductModel(
        category: 'Bellagio Coffee',
        name: 'Том ям 3',
        description: 'Пицца с соусом том ям 230 гр',
        price: 250,
        pictureUrl:
            'https://th.bing.com/th/id/R.6025cd217f7bd62c40859c33e3a01c03?rik=IFaOVth3KQAn6A&riu=http%3a%2f%2fpngimg.com%2fuploads%2fpizza%2fpizza_PNG7151.png&ehk=3DdwUhkb8np6LcabfaOep%2fLzLk19VXmGTmaZbJcfSE0%3d&risl=&pid=ImgRaw&r=0'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(
          onClearTap: () {},
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SelectFoodStatusButton(
                      isSelected: true,
                      text: 'Доставка',
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    SelectFoodStatusButton(
                      isSelected: false,
                      text: 'В заведении',
                      onTap: () {},
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                CartListView(products: products, isFoodCart: true,),
                SizedBox(height: 50,),
              ],
            ),
          ),
        ));
  }
}
