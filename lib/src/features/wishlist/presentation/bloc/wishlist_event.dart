part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent {}

class WishlistFetchEvent implements WishlistEvent {}

class WishlistItemRemoveEvent implements WishlistEvent {
  final String id;

  WishlistItemRemoveEvent({required this.id});
}

class WishlistItemAddEvent implements WishlistEvent {
  final String id;

  WishlistItemAddEvent({required this.id});
}
