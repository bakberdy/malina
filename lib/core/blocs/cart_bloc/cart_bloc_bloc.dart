import 'package:equatable/equatable.dart';
import 'package:malina/core/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocInitial()) {
    on<AddToCartEvent>(_onAddToCart);
    on<ClearFoodCart>(_onClearFoodCart);
    on<ClearProductCart>(_onClearProductCart);
    on<IncrementCartItem>(_onIncrementCount);
    on<DecrementCartItem>(_onDecrementCount);
    on<DeleteCartItem>(_onDeleteProductCart);
  }

  _onClearFoodCart(event, emit) {
    if (state is CartBlocLoaded) {
      final productCart = (state as CartBlocLoaded).productCart;
      emit(CartBlocInitial());
      emit(CartBlocLoaded(foodCart: {}, productCart: productCart));
    }
  }

  _onClearProductCart(event, emit) {
    if (state is CartBlocLoaded) {
      final foodCart = (state as CartBlocLoaded).foodCart;
      emit(CartBlocInitial());
      emit(CartBlocLoaded(foodCart: foodCart, productCart: {}));
    }
  }

  void _onDeleteProductCart(event, emit) {
    if (state is CartBlocLoaded) {
      Map<String, List<Map<ProductModel, int>>> foodCart =
          Map.from((state as CartBlocLoaded).foodCart);
      Map<String, List<Map<ProductModel, int>>> productCart =
          Map.from((state as CartBlocLoaded).productCart);

      bool isFood = event.product.isFood;
      Map<String, List<Map<ProductModel, int>>> targetCart =
          isFood ? foodCart : productCart;

      if (targetCart.containsKey(event.product.category)) {
        List<Map<ProductModel, int>> categoryList =
            List.from(targetCart[event.product.category]!);

        categoryList.removeWhere((productMap) {
          if (productMap.containsKey(event.product)) {
            return true;
          }
          return false;
        });

        if (categoryList.isEmpty) {
          targetCart.remove(event.product.category);
        } else {
          targetCart[event.product.category] = categoryList;
        }
      }
      emit(CartBlocInitial());
      emit(CartBlocLoaded(
        foodCart: Map.from(foodCart),
        productCart: Map.from(productCart),
      ));
    }
  }

  void _onIncrementCount(event, emit) {
    if (state is CartBlocLoaded) {
      Map<String, List<Map<ProductModel, int>>> foodCart =
          Map.from((state as CartBlocLoaded).foodCart);
      Map<String, List<Map<ProductModel, int>>> productCart =
          Map.from((state as CartBlocLoaded).productCart);

      bool isFood = event.product.isFood;
      Map<String, List<Map<ProductModel, int>>> targetCart =
          isFood ? foodCart : productCart;

      if (targetCart.containsKey(event.product.category)) {
        List<Map<ProductModel, int>> categoryList =
            List.from(targetCart[event.product.category]!);

        for (var productMap in categoryList) {
          if (productMap.containsKey(event.product)) {
            productMap[event.product] = productMap[event.product]! + 1;
            break;
          }
        }

        targetCart[event.product.category] = List.from(categoryList);
      }

      emit(CartBlocInitial());
      emit(CartBlocLoaded(
        foodCart: Map.from(foodCart),
        productCart: Map.from(productCart),
      ));
    }
  }

  void _onDecrementCount(event, emit) {
    if (state is CartBlocLoaded) {
      Map<String, List<Map<ProductModel, int>>> foodCart =
          Map.from((state as CartBlocLoaded).foodCart);
      Map<String, List<Map<ProductModel, int>>> productCart =
          Map.from((state as CartBlocLoaded).productCart);

      bool isFood = event.product.isFood;
      Map<String, List<Map<ProductModel, int>>> targetCart =
          isFood ? foodCart : productCart;

      if (targetCart.containsKey(event.product.category)) {
        List<Map<ProductModel, int>> categoryList =
            List.from(targetCart[event.product.category]!);

        categoryList.removeWhere((productMap) {
          if (productMap.containsKey(event.product)) {
            int count = productMap[event.product]!;

            if (count > 1) {
              productMap[event.product] = count - 1;
              return false;
            }

            return true;
          }
          return false;
        });

        if (categoryList.isEmpty) {
          targetCart.remove(event.product.category);
        } else {
          targetCart[event.product.category] = List.from(categoryList);
        }
      }

      emit(CartBlocLoaded(
        foodCart: Map.from(foodCart),
        productCart: Map.from(productCart),
      ));
    }
  }

  _onAddToCart(event, emit) {
    {
      Map<String, List<Map<ProductModel, int>>> foodCart =
          state is CartBlocLoaded
              ? _deepCopy((state as CartBlocLoaded).foodCart)
              : <String, List<Map<ProductModel, int>>>{};

      Map<String, List<Map<ProductModel, int>>> productCart =
          state is CartBlocLoaded
              ? _deepCopy((state as CartBlocLoaded).productCart)
              : <String, List<Map<ProductModel, int>>>{};

      Map<String, List<Map<ProductModel, int>>> targetCart =
          event.product.isFood ? foodCart : productCart;

      if (!targetCart.containsKey(event.product.category)) {
        targetCart[event.product.category] = [];
      }

      List<Map<ProductModel, int>> categoryList =
          List.from(targetCart[event.product.category]!);

      bool productExists = false;

      for (var productMap in categoryList) {
        if (productMap.containsKey(event.product)) {
          productMap[event.product] = productMap[event.product]! + 1;
          productExists = true;
          break;
        }
      }

      if (!productExists) {
        categoryList.add({event.product: 1});
      }

      targetCart[event.product.category] = List.from(categoryList);

      emit(CartBlocInitial());
      emit(CartBlocLoaded(
        foodCart: Map.from(foodCart),
        productCart: Map.from(productCart),
      ));
    }
  }

  Map<String, List<Map<ProductModel, int>>> _deepCopy(
      Map<String, List<Map<ProductModel, int>>> original) {
    return original.map((key, value) => MapEntry(
        key,
        value
            .map((productMap) => Map<ProductModel, int>.from(productMap))
            .toList()));
  }
}
