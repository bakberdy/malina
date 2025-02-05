import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina/core/models/product_model.dart';
import 'package:malina/ui/widgets/counter_widget.dart';

import '../../core/core.dart';

class CartListView extends StatelessWidget {
  const CartListView({
    super.key,
    required this.products,
    required this.isFoodCart,
    required this.category,
  });
  final bool isFoodCart;
  final List<Map<ProductModel, int>> products;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                spreadRadius: 0,
                blurRadius: 20,
                offset: Offset(0, 2),
                color: Color(0xff5F6773).withAlpha(40))
          ]),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                category,
                style: TextStyle(
                    height: 1.5,
                    color: AppColors.secondaryTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 12,
                color: AppColors.inactiveIcon,
              ),
            ],
          ),
          Divider(
            color: Color(0xffEDEBEB),
            thickness: 1,
          ),
          SizedBox(
            height: 5,
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _cartListItem(context, products[index].keys.first, products[index].values.first);
              }),
          SizedBox(
            height: isFoodCart ? 10 : 0,
          ),
          isFoodCart
              ? Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffF8F8F8),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline,
                        color: Color(0xff00B866),
                      ),
                      Text('Добавки',
                          style: TextStyle(
                              color: Color(0xff00B866),
                              fontWeight: FontWeight.w400,
                              fontSize: 16))
                    ],
                  ),
                )
              : SizedBox(),
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.primary,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Заказать',
                    style: TextStyle(
                        color: AppColors.whiteTextColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 16)),
                Text(
                  '32000 \$',
                  style: TextStyle(
                      height: 1.1,
                      color: AppColors.whiteTextColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Row _cartListItem(BuildContext context, ProductModel product, int count) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 8),
            //  height: 110*MediaQuery.of(context).size.height/844,
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xffF8F8F8),
            ),
            child: Image.network(product.pictureUrl, fit: BoxFit.fitHeight,),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      product.name,
                      style: TextStyle(
                          height: 1.5,
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Text(
                    '${product.price} \$',
                    style: TextStyle(
                        height: 1.1,
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    product.description,
                    style: TextStyle(
                        height: 1.1,
                        color: AppColors.secondaryTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  )),
              SizedBox(
                height: 15,
              ),
              CounterWidget(
                    onIncrement: () {
                      context
                          .read<CartBloc>()
                          .add(IncrementCartItem(product: product));
                    },
                    onDecrement: () {
                      context
                          .read<CartBloc>()
                          .add(DecrementCartItem(product: product));
                    },
                    onDelete: () {
                      context.read<CartBloc>().add(product.isFood
                          ? ClearFoodCart()
                          : ClearProductCart());
                    },
                    value: count
              )
            ],
          ),
        )
      ],
    );
  }
}
