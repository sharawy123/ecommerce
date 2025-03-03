import '../../models/cart_response.dart';

abstract class CartRemoteDataSource {

  Future <void> addToCart (String productId);
  Future <CartResponse> deleteFromCart (String productId);
  Future <CartResponse> updateCart (String productId , int count);
  Future <CartResponse> getCart ();

}