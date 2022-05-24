part of 'cart_bloc.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoadFailure extends CartState {
  final String message;

  CartLoadFailure(this.message);
}

class CartLoadSuccess extends CartState {
  final List<Cart> cartItems;

  CartLoadSuccess({required this.cartItems});
}

class CartUpdating extends CartState {}

class CartUpdateFailure extends CartState {
  final String message;

  CartUpdateFailure(this.message);
}
