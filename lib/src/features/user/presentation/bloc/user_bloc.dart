import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:super_module/src/features/auth/data/models/user_model.dart';
import 'package:super_module/src/features/user/data/model/user_rank.dart';
import 'package:super_module/src/features/user/data/model/user_rank_model.dart';
import 'package:super_module/src/features/user/domain/controller/user_controller.dart';

part 'user_event.dart';
part 'user_state.dart';

@Injectable()
class UserBloc extends Bloc<UserEvent, UserState> {
  final IUserController controller;

  UserBloc(this.controller) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is UserRankFetchEvent) {
      yield UserRankFetching();
      // if (result?.errorMessage != null) {
      //   yield UserRankFetchFailure(errorMessage: result.errorMessage);
      //   return;
      // }
      // yield UserRankFetchSuccess(userRankList: result.response);
    } else if (event is UserInformationUpdateEvent) {
      yield UserInformationUpdating();
      final result = await controller.userInformationUpdate(
          model: event.userModel, token: event.token);
      if (result.ok) {
        yield UserInformationUpdateSuccess(phone: result.data.phone);
        return;
      }
      yield UserInformationUpdateFailure(message: result.message);
    }
  }
}
