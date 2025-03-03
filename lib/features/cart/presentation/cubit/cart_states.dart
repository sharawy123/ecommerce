abstract class CartStates {}

class CartInitial extends CartStates {}

class getCartSuccess extends CartStates {}

class getCartError extends CartStates {
  final String message;

  getCartError(this.message);
}

class getCartLoading extends CartStates {}

class updateCartSuccess extends CartStates {}

class updateCartError extends CartStates {
  final String message;

  updateCartError(this.message);
}

class updateCartLoading extends CartStates {}

class deleteFromCartSuccess extends CartStates {}

class deleteFromCartError extends CartStates {
  final String message;

  deleteFromCartError(this.message);
}

class deleteFromCartLoading extends CartStates {}

class addToCartSuccess extends CartStates {}

class addToCartError extends CartStates {
  final String message;

  addToCartError(this.message);
}

class addToCartLoading extends CartStates {}
