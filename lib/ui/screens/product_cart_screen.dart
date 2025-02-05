import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina/core/core.dart';
import 'package:malina/ui/widgets/cart_listview.dart';
import 'package:malina/ui/widgets/custom_app_bar.dart';


@RoutePage()
class ProductCartScreen extends StatelessWidget {
  const ProductCartScreen({super.key});


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
        child: BlocBuilder<CartBloc, CartBlocState>(
          builder: (context, state) {
            if (state is! CartBlocLoaded) return SizedBox();
            Map<String, List<Map<ProductModel, int>>> productCart =
                state.productCart;
            return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 15,
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: productCart.length,
                  itemBuilder: (context, index) {
                    String category = productCart.keys.elementAt(index);
                    List<Map<ProductModel, int>> products =
                        productCart[category] ?? [];
                    return CartListView(
                      products: products,
                      isFoodCart: false,
                      category: category,
                    );
                  },
                ));
          },
        ),
      ),
    );
  }
}
