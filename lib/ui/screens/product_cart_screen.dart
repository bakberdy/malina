import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:malina/core/models/product_model.dart';
import 'package:malina/core/themes/app_colors.dart';
import 'package:malina/ui/widgets/cart_listview.dart';
import 'package:malina/ui/widgets/custom_app_bar.dart';

@RoutePage()
class ProductCartScreen extends StatelessWidget {
   ProductCartScreen({super.key});

  final products = [
    ProductModel(category: 'Hair', name: 'Elseve', description: 'Бальзам для волос Elseve Гиалурон Баланс, 400 мл', price: 150, pictureUrl: 'https://www.loreal-paris.ru/-/media/project/loreal/brand-sites/oap/emea/ru/products/hair/hair-care/elseve/hyaluron-balans/hyaluron-balans-balsam-400/3600524151263_0.png?rev=027abd2b208c41a3a7d78a7fb434eb76&w=200&hash=8A57E3454F60105657FFFD3D59964C7B27A96083'),
    ProductModel(category: 'Hair', name: 'Elseve', description: 'Бальзам для волос Elseve Гиалурон Баланс, 400 мл', price: 150, pictureUrl: 'https://www.loreal-paris.ru/-/media/project/loreal/brand-sites/oap/emea/ru/products/hair/hair-care/elseve/hyaluron-balans/hyaluron-balans-balsam-400/3600524151263_0.png?rev=027abd2b208c41a3a7d78a7fb434eb76&w=200&hash=8A57E3454F60105657FFFD3D59964C7B27A96083'),
    ProductModel(category: 'Hair', name: 'Elseve', description: 'Бальзам для волос Elseve Гиалурон Баланс, 400 мл', price: 150, pictureUrl: 'https://www.loreal-paris.ru/-/media/project/loreal/brand-sites/oap/emea/ru/products/hair/hair-care/elseve/hyaluron-balans/hyaluron-balans-balsam-400/3600524151263_0.png?rev=027abd2b208c41a3a7d78a7fb434eb76&w=200&hash=8A57E3454F60105657FFFD3D59964C7B27A96083'),
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
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          child: CartListView(
            products: products,
            isFoodCart: true,
          ),
        ),
      ),
    );
  }
}
