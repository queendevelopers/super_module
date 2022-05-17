part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistLoadFailure extends WishlistState {
  final String message;

  WishlistLoadFailure(this.message);
}

class WishlistLoadSuccess extends WishlistState {
  final List<WishList> WishlistItems;

  WishlistLoadSuccess({required this.WishlistItems});
}

class WishlistUpdating extends WishlistState {}

class WishlistUpdateFailure extends WishlistState {
  final String message;

  WishlistUpdateFailure(this.message);
}
