import 'package:ecommerce/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/delete_from_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/get_cart.dart';
import 'package:ecommerce/features/cart/domain/use_cases/update_cart.dart';
import 'package:ecommerce/features/cart/presentation/cubit/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entities/cart.dart';

@lazySingleton
class CartCubit extends Cubit<CartStates> {
  CartCubit(
      this._addToCart, this._deleteFromCart, this._updateCart, this._getCart)
      : super(CartInitial());

  final AddToCart _addToCart;
  final DeleteFromCart _deleteFromCart;
  final UpdateCart _updateCart;
  final GetCart _getCart;
  late Cart cart;

  Future<void> getCart() async {
    emit(getCartLoading());
    final result = await _getCart();
    result.fold(
      (failure) => emit(getCartError(failure.message)),
      (userCart) {
        cart = userCart;
        emit(getCartSuccess());
      },
    );
  }

  Future <void> addToCart(String productId) async {
    emit(addToCartLoading());
    final result = await _addToCart(productId);
    result.fold(
         (failure) => emit(addToCartError(failure.message)),
      (_) => emit(addToCartSuccess()),
    );

  }

  Future<void> updateCart(String productId,int quantity) async {
    emit(updateCartLoading());
    final result = await _updateCart(productId,quantity);
    result.fold(
          (failure) => emit(updateCartError(failure.message)),
          (updateCart) {
            cart=updateCart;
            emit(updateCartSuccess());
          },
    );
  }
  Future<void> deleteFromCart(String productId) async {
    emit(deleteFromCartLoading());
    final result = await _deleteFromCart(productId);
    result.fold(
          (failure) => emit(deleteFromCartError(failure.message)),
          (updatedCart) {
        cart=updatedCart;
        emit(deleteFromCartSuccess());
      },
    );
  }

}
