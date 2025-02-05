part of 'cart_bloc_bloc.dart';

sealed class CartBlocEvent extends Equatable {
  const CartBlocEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartBlocEvent{
  final ProductModel product;

  const AddToCartEvent({required this.product});
}

class IncrementCartItem extends CartBlocEvent{
  final ProductModel product;

  const IncrementCartItem({ required this.product});
}

class DecrementCartItem extends CartBlocEvent{
  final ProductModel product;

  const DecrementCartItem({ required this.product});
}
class DeleteCartItem extends CartBlocEvent{
  final ProductModel product;

  const DeleteCartItem({ required this.product});
}

class ClearFoodCart extends CartBlocEvent{}
class ClearProductCart extends CartBlocEvent{}

