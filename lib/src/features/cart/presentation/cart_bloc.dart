import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/cart/data/models/cart_list.dart';
import 'package:super_module/src/features/cart/domain/controller/cart_controller.dart';

part 'cart_event.dart';
part 'cart_state.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartController controller;

  CartBloc(this.controller) : super(CartInitial()) {
    on<CartEvent>((event, emit) async {
      if (event is CartFetchEvent) {
        emit(CartLoading());
        final response = await controller.getCartItems();
        if (response.ok) {
          emit(CartLoadSuccess(cartItems: response.response));
          return;
        }
        emit(CartLoadFailure(response.message ?? 'An Unknown Error Occurred.'));
      } else if (event is CartItemAddEvent) {
        emit(CartUpdating());
        final response = await controller.addToCart(id: event.id);
        if (response.ok) {
          emit(CartLoadSuccess(cartItems: response.response));
          return;
        }
        emit(CartUpdateFailure(
            response.message ?? 'An Unknown Error Occurred.'));
      } else if (event is CartItemRemoveEvent) {
        emit(CartUpdating());
        final response = await controller.addToCart(id: event.id);
        if (response.ok) {
          emit(CartLoadSuccess(cartItems: response.response));
          return;
        }
        emit(CartUpdateFailure(
            response.message ?? 'An Unknown Error Occurred.'));
      }
    });
  }
}
