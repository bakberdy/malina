import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina/core/core.dart';
import 'package:malina/ui/widgets/cart_listview.dart';
import 'package:malina/ui/widgets/custom_app_bar.dart';
import 'package:malina/ui/widgets/select_food_status.dart';

@RoutePage()
class FoodCartScreen extends StatelessWidget {
  const FoodCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.bgColor,
        appBar: CustomAppBar(
          onClearTap: () {
            context.read<CartBloc>().add(ClearFoodCart());
          },
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
                BlocBuilder<CartBloc, CartBlocState>(
                  builder: (context, state) {
                    if (state is! CartBlocLoaded) return SizedBox();
                    Map<String, List<Map<ProductModel, int>>> foodCart =
                        state.foodCart;
                    return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: foodCart.length,
                      itemBuilder: (context, index) {
                        String category = foodCart.keys.elementAt(index);
                        List<Map<ProductModel, int>> products =
                            foodCart[category] ?? [];
                        return CartListView(
                          products: products,
                          isFoodCart: true,
                          category: category,
                        );
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ));
  }
}
