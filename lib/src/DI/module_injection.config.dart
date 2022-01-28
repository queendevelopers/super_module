// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:rest_client/rest_client.dart' as _i6;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../super_module.dart' as _i17;
import '../core/service/fcm_service.dart' as _i3;
import '../features/address/data/repository/address_repository.dart' as _i5;
import '../features/address/domain/controller/i_address_controller.dart'
    as _i18;
import '../features/address/domain/repository/i_address_repository.dart' as _i4;
import '../features/address/presentation/bloc/address_bloc.dart' as _i25;
import '../features/auth/biometric/bloc/biometric_bloc.dart' as _i26;
import '../features/auth/data/repositories/auth_remote_repository.dart' as _i20;
import '../features/auth/domain/controller/auth_login_controller.dart' as _i27;
import '../features/auth/domain/repositories/i_auth_remote_repository.dart'
    as _i19;
import '../features/auth/presentation/bloc/forgot_password_bloc/change_forgot_password_bloc/change_forgot_password_bloc.dart'
    as _i32;
import '../features/auth/presentation/bloc/forgot_password_bloc/reset_password_bloc/reset_password_bloc.dart'
    as _i30;
import '../features/auth/presentation/bloc/forgot_password_bloc/verify_opt_bloc/verify_otp_bloc.dart'
    as _i31;
import '../features/auth/presentation/bloc/login_bloc/login_bloc.dart' as _i28;
import '../features/auth/presentation/bloc/register_bloc/register_bloc.dart'
    as _i29;
import '../features/auth/presentation/bloc/register_phone_by_otp_bloc/register_phone_by_otp_bloc.dart'
    as _i15;
import '../features/auth/social/data/repository/i_social_repository.dart'
    as _i21;
import '../features/auth/social/data/repository/social_auth_repository.dart'
    as _i22;
import '../features/auth/social/presentation/social_bloc.dart' as _i16;
import '../features/user/data/repositories/user_remote_repostiory.dart' as _i14;
import '../features/user/data/session/app_manager.dart' as _i8;
import '../features/user/data/session/i_app_manager.dart' as _i7;
import '../features/user/data/session/i_session_manager.dart' as _i10;
import '../features/user/data/session/session_manager.dart' as _i11;
import '../features/user/domain/controller/user_controller.dart' as _i23;
import '../features/user/domain/repositories/i_user_remote_repository.dart'
    as _i13;
import '../features/user/presentation/bloc/user_bloc.dart'
    as _i24; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initModuleGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.FirebaseService>(() => _i3.FirebaseService());
  gh.factory<_i4.IAddressRepository>(
      () => _i5.AddressRepository(get<_i6.IHttpHelper>()));
  gh.factory<_i7.IAppManager>(
      () => _i8.AppManager(get<_i9.SharedPreferences>()));
  gh.factory<_i10.ISessionManager>(
      () => _i11.SessionManager(get<_i12.FlutterSecureStorage>()));
  gh.factory<_i13.IUserRemoteRepository>(() => _i14.UserRemoteRepository(
      get<_i6.IHttpHelper>(), get<_i10.ISessionManager>()));
  gh.factory<_i15.RegisterPhoneByOtpBloc>(() => _i15.RegisterPhoneByOtpBloc());
  gh.factory<_i16.SocialBloc>(() => _i16.SocialBloc(
      get<_i17.ISocialAuthRepository>(), get<_i10.ISessionManager>()));
  gh.factory<_i18.IAddressController>(
      () => _i18.CheckoutController(get<_i4.IAddressRepository>()));
  gh.factory<_i19.IAuthRemoteRepository>(() => _i20.AuthRemoteRepository(
      get<_i6.IHttpHelper>(), get<_i10.ISessionManager>()));
  gh.factory<_i21.ISocialAuthRepository>(
      () => _i22.SocialAuthRepository(get<_i19.IAuthRemoteRepository>()));
  gh.factory<_i23.IUserController>(
      () => _i23.UserController(get<_i13.IUserRemoteRepository>()));
  gh.factory<_i24.UserBloc>(() => _i24.UserBloc(get<_i23.IUserController>()));
  gh.factory<_i25.AddressBloc>(
      () => _i25.AddressBloc(get<_i18.IAddressController>()));
  gh.factory<_i26.BiometricBloc>(() => _i26.BiometricBloc(
      get<_i19.IAuthRemoteRepository>(), get<_i10.ISessionManager>()));
  gh.factory<_i27.IAuthLoginController>(() => _i27.AuthLoginController(
      get<_i19.IAuthRemoteRepository>(), get<_i10.ISessionManager>()));
  gh.factory<_i28.LoginBloc>(() => _i28.LoginBloc(
      get<_i27.IAuthLoginController>(), get<_i10.ISessionManager>()));
  gh.factory<_i29.RegisterBloc>(() => _i29.RegisterBloc(
      get<_i27.IAuthLoginController>(), get<_i10.ISessionManager>()));
  gh.factory<_i30.ResetPasswordBloc>(
      () => _i30.ResetPasswordBloc(get<_i27.IAuthLoginController>()));
  gh.factory<_i31.VerifyOtpBloc>(() => _i31.VerifyOtpBloc(
      get<_i27.IAuthLoginController>(), get<_i10.ISessionManager>()));
  gh.factory<_i32.ChangeForgotPasswordBloc>(() => _i32.ChangeForgotPasswordBloc(
      get<_i27.IAuthLoginController>(), get<_i10.ISessionManager>()));
  return get;
}
