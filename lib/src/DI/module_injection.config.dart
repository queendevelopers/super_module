// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i11;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rest_client/rest_client.dart' as _i5;
import 'package:shared_preferences/shared_preferences.dart' as _i8;

import '../../super_module.dart' as _i17;
import '../address/data/repository/address_repository.dart' as _i4;
import '../address/domain/controller/i_address_controller.dart' as _i18;
import '../address/domain/repository/i_address_repository.dart' as _i3;
import '../address/presentation/bloc/address_bloc.dart' as _i24;
import '../auth/biometric/bloc/biometric_bloc.dart' as _i25;
import '../auth/data/repositories/auth_remote_repository.dart' as _i20;
import '../auth/domain/controller/auth_login_controller.dart' as _i26;
import '../auth/domain/repositories/i_auth_remote_repository.dart' as _i19;
import '../auth/presentation/bloc/forgot_password_bloc/change_forgot_password_bloc/change_forgot_password_bloc.dart'
    as _i31;
import '../auth/presentation/bloc/forgot_password_bloc/reset_password_bloc/reset_password_bloc.dart'
    as _i29;
import '../auth/presentation/bloc/forgot_password_bloc/verify_opt_bloc/verify_otp_bloc.dart'
    as _i30;
import '../auth/presentation/bloc/login_bloc/login_bloc.dart' as _i27;
import '../auth/presentation/bloc/register_bloc/register_bloc.dart' as _i28;
import '../auth/presentation/bloc/register_phone_by_otp_bloc/register_phone_by_otp_bloc.dart'
    as _i14;
import '../auth/social/data/repository/i_social_repository.dart' as _i16;
import '../auth/social/data/repository/social_auth_repository.dart' as _i21;
import '../auth/social/presentation/social_bloc.dart' as _i15;
import '../user/data/repositories/user_remote_repostiory.dart' as _i13;
import '../user/data/session/app_manager.dart' as _i7;
import '../user/data/session/i_app_manager.dart' as _i6;
import '../user/data/session/i_session_manager.dart' as _i9;
import '../user/data/session/session_manager.dart' as _i10;
import '../user/domain/controller/user_controller.dart' as _i22;
import '../user/domain/repositories/i_user_remote_repository.dart' as _i12;
import '../user/presentation/bloc/user_bloc.dart'
    as _i23; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initModuleGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.IAddressRepository>(
      () => _i4.AddressRepository(get<_i5.IHttpHelper>()));
  gh.factory<_i6.IAppManager>(
      () => _i7.AppManager(get<_i8.SharedPreferences>()));
  gh.factory<_i9.ISessionManager>(
      () => _i10.SessionManager(get<_i11.FlutterSecureStorage>()));
  gh.factory<_i12.IUserRemoteRepository>(() => _i13.UserRemoteRepository(
      get<_i5.IHttpHelper>(), get<_i9.ISessionManager>()));
  gh.factory<_i14.RegisterPhoneByOtpBloc>(() => _i14.RegisterPhoneByOtpBloc());
  gh.factory<_i15.SocialBloc>(() => _i15.SocialBloc(
      get<_i16.ISocialAuthRepository>(), get<_i17.ISessionManager>()));
  gh.factory<_i18.IAddressController>(
      () => _i18.CheckoutController(get<_i3.IAddressRepository>()));
  gh.factory<_i19.IAuthRemoteRepository>(() => _i20.AuthRemoteRepository(
      get<_i5.IHttpHelper>(), get<_i9.ISessionManager>()));
  gh.factory<_i16.ISocialAuthRepository>(
      () => _i21.SocialAuthRepository(get<_i19.IAuthRemoteRepository>()));
  gh.factory<_i22.IUserController>(
      () => _i22.UserController(get<_i12.IUserRemoteRepository>()));
  gh.factory<_i23.UserBloc>(() => _i23.UserBloc(get<_i22.IUserController>()));
  gh.factory<_i24.AddressBloc>(
      () => _i24.AddressBloc(get<_i18.IAddressController>()));
  gh.factory<_i25.BiometricBloc>(() => _i25.BiometricBloc(
      get<_i19.IAuthRemoteRepository>(), get<_i9.ISessionManager>()));
  gh.factory<_i26.IAuthLoginController>(() => _i26.AuthLoginController(
      get<_i19.IAuthRemoteRepository>(), get<_i9.ISessionManager>()));
  gh.factory<_i27.LoginBloc>(() => _i27.LoginBloc(
      get<_i26.IAuthLoginController>(), get<_i9.ISessionManager>()));
  gh.factory<_i28.RegisterBloc>(() => _i28.RegisterBloc(
      get<_i26.IAuthLoginController>(), get<_i9.ISessionManager>()));
  gh.factory<_i29.ResetPasswordBloc>(
      () => _i29.ResetPasswordBloc(get<_i26.IAuthLoginController>()));
  gh.factory<_i30.VerifyOtpBloc>(() => _i30.VerifyOtpBloc(
      get<_i26.IAuthLoginController>(), get<_i9.ISessionManager>()));
  gh.factory<_i31.ChangeForgotPasswordBloc>(() => _i31.ChangeForgotPasswordBloc(
      get<_i26.IAuthLoginController>(), get<_i9.ISessionManager>()));
  return get;
}
