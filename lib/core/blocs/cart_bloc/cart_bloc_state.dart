part of 'cart_bloc_bloc.dart';

sealed class CartBlocState extends Equatable {
  const CartBlocState();
  
  @override
  List<Object> get props => [];
}

final class CartBlocInitial extends CartBlocState {

}

final class CartBlocLoaded extends CartBlocState {
  //использую мап что бы разделять по категориям, ключом будет название категории
  //а внутренний мап с инт у нас счетчик сколько выбрал юзер
  final Map<String, List<Map<ProductModel,int>>> foodCart;
  final Map<String, List<Map<ProductModel,int>>> productCart;

  const CartBlocLoaded({required this.foodCart, required this.productCart});
  
}
