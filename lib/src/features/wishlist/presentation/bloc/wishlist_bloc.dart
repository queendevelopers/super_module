import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/wishlist/data/models/wish_list.dart';
import 'package:super_module/src/features/wishlist/domain/controller/wishlist_controller.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

@injectable
class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  final IWishlistController controller;

  WishlistBloc(this.controller) : super(WishlistInitial()) {
    on<WishlistEvent>((event, emit) async {
      if (event is WishlistFetchEvent) {
        emit(WishlistLoading());
        final response = await controller.getWishlistItems();
        if (response.ok) {
          emit(WishlistLoadSuccess(wishlistItems: response.response));
          return;
        }
        emit(WishlistLoadFailure(
            response.message ?? 'An Unknown Error Occurred.'));
      } else if (event is WishlistItemAddEvent) {
        emit(WishlistUpdating());
        final response = await controller.addToWishlist(id: event.id);
        if (response.ok) {
          emit(WishlistLoadSuccess(wishlistItems: response.response));
          return;
        }
        emit(WishlistUpdateFailure(
            response.message ?? 'An Unknown Error Occurred.'));
      } else if (event is WishlistItemRemoveEvent) {
        emit(WishlistUpdating());
        final response = await controller.addToWishlist(id: event.id);
        if (response.ok) {
          emit(WishlistLoadSuccess(wishlistItems: response.response));
          return;
        }
        emit(WishlistUpdateFailure(
            response.message ?? 'An Unknown Error Occurred.'));
      }
    });
  }
}
