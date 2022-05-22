// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_rest_client/flutter_rest_client.dart' as _i7;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i10;

import '../../super_module.dart' as _i32;
import '../core/service/fcm_service.dart' as _i4;
import '../features/address/data/repository/address_repository.dart' as _i6;
import '../features/address/domain/controller/i_address_controller.dart'
    as _i21;
import '../features/address/domain/repository/i_address_repository.dart' as _i5;
import '../features/address/presentation/bloc/address_bloc.dart' as _i35;
import '../features/auth/biometric/bloc/biometric_bloc.dart' as _i42;
import '../features/auth/data/repositories/auth_remote_repository.dart' as _i23;
import '../features/auth/domain/controller/auth_login_controller.dart' as _i37;
import '../features/auth/domain/repositories/i_auth_remote_repository.dart'
    as _i22;
import '../features/auth/presentation/bloc/forgot_password_bloc/change_forgot_password_bloc/change_forgot_password_bloc.dart'
    as _i43;
import '../features/auth/presentation/bloc/forgot_password_bloc/reset_password_bloc/reset_password_bloc.dart'
    as _i40;
import '../features/auth/presentation/bloc/forgot_password_bloc/verify_opt_bloc/verify_otp_bloc.dart'
    as _i41;
import '../features/auth/presentation/bloc/login_bloc/login_bloc.dart' as _i38;
import '../features/auth/presentation/bloc/register_bloc/register_bloc.dart'
    as _i39;
import '../features/auth/presentation/bloc/register_phone_by_otp_bloc/register_phone_by_otp_bloc.dart'
    as _i20;
import '../features/auth/social/data/repository/i_social_repository.dart'
    as _i27;
import '../features/auth/social/data/repository/social_auth_repository.dart'
    as _i28;
import '../features/auth/social/presentation/social_bloc.dart' as _i31;
import '../features/cart/data/repositories/cart_repositories.dart' as _i12;
import '../features/cart/domain/controller/cart_controller.dart' as _i24;
import '../features/cart/domain/repositories/i_cart_repositories.dart' as _i11;
import '../features/cart/presentation/bloc/cart_bloc.dart' as _i36;
import '../features/chat/data/repositories/chat_repository.dart' as _i26;
import '../features/chat/domain/repositories/i_chat_repository.dart' as _i25;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i3;
import '../features/user/data/repositories/user_remote_repostiory.dart' as _i17;
import '../features/user/data/session/app_manager.dart' as _i9;
import '../features/user/data/session/i_app_manager.dart' as _i8;
import '../features/user/data/session/i_session_manager.dart' as _i13;
import '../features/user/data/session/session_manager.dart' as _i14;
import '../features/user/domain/controller/user_controller.dart' as _i29;
import '../features/user/domain/repositories/i_user_remote_repository.dart'
    as _i16;
import '../features/user/presentation/bloc/user_bloc.dart' as _i33;
import '../features/wishlist/data/repositories/wishlist_repositories.dart'
    as _i19;
import '../features/wishlist/domain/controller/wishlist_controller.dart'
    as _i30;
import '../features/wishlist/domain/repositories/i_wishlist_repositories.dart'
    as _i18;
import '../features/wishlist/presentation/bloc/wishlist_bloc.dart'
    as _i34; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initModuleGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ChatBloc>(() => _i3.ChatBloc());
  gh.factory<_i4.FirebaseNotificationService>(
      () => _i4.FirebaseNotificationService());
  gh.factory<_i5.IAddressRepository>(
      () => _i6.AddressRepository(get<_i7.IHttpHelper>()));
  gh.factory<_i8.IAppManager>(
      () => _i9.AppManager(get<_i10.SharedPreferences>()));
  gh.factory<_i11.ICartRepository>(
      () => _i12.CartRepositories(get<_i7.IHttpHelper>()));
  gh.factory<_i13.ISessionManager>(
      () => _i14.SessionManager(get<_i15.FlutterSecureStorage>()));
  gh.factory<_i16.IUserRemoteRepository>(() => _i17.UserRemoteRepository(
      get<_i7.IHttpHelper>(), get<_i13.ISessionManager>()));
  gh.factory<_i18.IWishlistRepository>(
      () => _i19.WishlistRepositories(get<_i7.IHttpHelper>()));
  gh.factory<_i20.RegisterPhoneByOtpBloc>(() => _i20.RegisterPhoneByOtpBloc());
  gh.factory<_i21.IAddressController>(
      () => _i21.CheckoutController(get<_i5.IAddressRepository>()));
  gh.factory<_i22.IAuthRemoteRepository>(() => _i23.AuthRemoteRepository(
      get<_i7.IHttpHelper>(), get<_i13.ISessionManager>()));
  gh.factory<_i24.ICartController>(
      () => _i24.CartController(get<_i11.ICartRepository>()));
  gh.factory<_i25.IChatRepository>(
      () => _i26.ChatRepository(get<_i13.ISessionManager>()));
  gh.factory<_i27.ISocialAuthRepository>(
      () => _i28.SocialAuthRepository(get<_i22.IAuthRemoteRepository>()));
  gh.factory<_i29.IUserController>(
      () => _i29.UserController(get<_i16.IUserRemoteRepository>()));
  gh.factory<_i30.IWishlistController>(
      () => _i30.WishlistController(get<_i18.IWishlistRepository>()));
  gh.factory<_i31.SocialBloc>(() => _i31.SocialBloc(
      get<_i27.ISocialAuthRepository>(), get<_i32.ISessionManager>()));
  gh.factory<_i33.UserBloc>(() =>
      _i33.UserBloc(get<_i29.IUserController>(), get<_i13.ISessionManager>()));
  gh.factory<_i34.WishlistBloc>(
      () => _i34.WishlistBloc(get<_i30.IWishlistController>()));
  gh.factory<_i35.AddressBloc>(
      () => _i35.AddressBloc(get<_i21.IAddressController>()));
  gh.factory<_i36.CartBloc>(() => _i36.CartBloc(get<_i24.ICartController>()));
  gh.factory<_i37.IAuthLoginController>(() => _i37.AuthLoginController(
      get<_i22.IAuthRemoteRepository>(),
      get<_i13.ISessionManager>(),
      get<_i8.IAppManager>()));
  gh.factory<_i38.LoginBloc>(() => _i38.LoginBloc(
      get<_i37.IAuthLoginController>(), get<_i13.ISessionManager>()));
  gh.factory<_i39.RegisterBloc>(() => _i39.RegisterBloc(
      get<_i37.IAuthLoginController>(), get<_i13.ISessionManager>()));
  gh.factory<_i40.ResetPasswordBloc>(
      () => _i40.ResetPasswordBloc(get<_i37.IAuthLoginController>()));
  gh.factory<_i41.VerifyOtpBloc>(() => _i41.VerifyOtpBloc(
      get<_i37.IAuthLoginController>(), get<_i13.ISessionManager>()));
  gh.factory<_i42.BiometricBloc>(() => _i42.BiometricBloc(
      get<_i32.IAuthRemoteRepository>(),
      get<_i32.ISessionManager>(),
      get<_i37.IAuthLoginController>(),
      get<_i32.IAppManager>()));
  gh.factory<_i43.ChangeForgotPasswordBloc>(() => _i43.ChangeForgotPasswordBloc(
      get<_i37.IAuthLoginController>(), get<_i13.ISessionManager>()));
  return get;
}
