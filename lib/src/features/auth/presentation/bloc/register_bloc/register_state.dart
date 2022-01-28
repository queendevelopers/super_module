part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final String? errorMessage;

  RegisterFailureState({this.errorMessage});
}

class RegisterSuccessState extends RegisterState {
  final LoginModel response;

  RegisterSuccessState(this.response);
}

class UsernameCheckingState extends RegisterState {}

class UsernameCheckFailureState extends RegisterState {
  final GlobalResponseModel responseModel;

  UsernameCheckFailureState(this.responseModel);
}

class UsernameCheckSuccessState extends RegisterState {
  final GlobalResponseModel responseModel;

  UsernameCheckSuccessState(this.responseModel);
}
