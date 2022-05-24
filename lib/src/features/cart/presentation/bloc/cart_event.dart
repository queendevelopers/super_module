part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartFetchEvent implements CartEvent {}

class CartItemRemoveEvent implements CartEvent {
  final String id;

  CartItemRemoveEvent({required this.id});
}

class CartItemAddEvent implements CartEvent {
  final String id;

  CartItemAddEvent({required this.id});
}