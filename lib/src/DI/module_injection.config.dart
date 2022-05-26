// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_rest_client/flutter_rest_client.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i14;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../super_module.dart' as _i31;
import '../core/service/fcm_service.dart' as _i3;
import '../features/address/data/repository/address_repository.dart' as _i5;
import '../features/address/domain/controller/i_address_controller.dart'
    as _i20;
import '../features/address/domain/repository/i_address_repository.dart' as _i4;
import '../features/address/presentation/bloc/address_bloc.dart' as _i34;
import '../features/auth/biometric/bloc/biometric_bloc.dart' as _i42;
import '../features/auth/data/repositories/auth_remote_repository.dart' as _i22;
import '../features/auth/domain/controller/auth_login_controller.dart' as _i36;
import '../features/auth/domain/repositories/i_auth_remote_repository.dart'
    as _i21;
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
    as _i19;
import '../features/auth/social/data/repository/i_social_repository.dart'
    as _i26;
import '../features/auth/social/data/repository/social_auth_repository.dart'
    as _i27;
import '../features/auth/social/presentation/social_bloc.dart' as _i30;
import '../features/cart/data/repositories/cart_repositories.dart' as _i11;
import '../features/cart/domain/controller/cart_controller.dart' as _i23;
import '../features/cart/domain/repositories/i_cart_repositories.dart' as _i10;
import '../features/cart/presentation/bloc/cart_bloc.dart' as _i35;
import '../features/chat/data/repositories/chat_repository.dart' as _i25;
import '../features/chat/domain/controller/chat_controller.dart' as _i37;
import '../features/chat/domain/repositories/i_chat_repository.dart' as _i24;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i44;
import '../features/user/data/repositories/user_remote_repostiory.dart' as _i16;
import '../features/user/data/session/app_manager.dart' as _i8;
import '../features/user/data/session/i_app_manager.dart' as _i7;
import '../features/user/data/session/i_session_manager.dart' as _i12;
import '../features/user/data/session/session_manager.dart' as _i13;
import '../features/user/domain/controller/user_controller.dart' as _i28;
import '../features/user/domain/repositories/i_user_remote_repository.dart'
    as _i15;
import '../features/user/presentation/bloc/user_bloc.dart' as _i32;
import '../features/wishlist/data/repositories/wishlist_repositories.dart'
    as _i18;
import '../features/wishlist/domain/controller/wishlist_controller.dart'
    as _i29;
import '../features/wishlist/domain/repositories/i_wishlist_repositories.dart'
    as _i17;
import '../features/wishlist/presentation/bloc/wishlist_bloc.dart'
    as _i33; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initModuleGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.FirebaseNotificationService>(
      () => _i3.FirebaseNotificationService());
  gh.factory<_i4.IAddressRepository>(
      () => _i5.AddressRepository(get<_i6.IHttpHelper>()));
  gh.factory<_i7.IAppManager>(
      () => _i8.AppManager(get<_i9.SharedPreferences>()));
  gh.factory<_i10.ICartRepository>(
      () => _i11.CartRepositories(get<_i6.IHttpHelper>()));
  gh.factory<_i12.ISessionManager>(
      () => _i13.SessionManager(get<_i14.FlutterSecureStorage>()));
  gh.factory<_i15.IUserRemoteRepository>(() => _i16.UserRemoteRepository(
      get<_i6.IHttpHelper>(), get<_i12.ISessionManager>()));
  gh.factory<_i17.IWishlistRepository>(
      () => _i18.WishlistRepositories(get<_i6.IHttpHelper>()));
  gh.factory<_i19.RegisterPhoneByOtpBloc>(() => _i19.RegisterPhoneByOtpBloc());
  gh.factory<_i20.IAddressController>(
      () => _i20.CheckoutController(get<_i4.IAddressRepository>()));
  gh.factory<_i21.IAuthRemoteRepository>(() => _i22.AuthRemoteRepository(
      get<_i6.IHttpHelper>(), get<_i12.ISessionManager>()));
  gh.factory<_i23.ICartController>(
      () => _i23.CartController(get<_i10.ICartRepository>()));
  gh.factory<_i24.IChatRepository>(
      () => _i25.ChatRepository(get<_i12.ISessionManager>()));
  gh.factory<_i26.ISocialAuthRepository>(
      () => _i27.SocialAuthRepository(get<_i21.IAuthRemoteRepository>()));
  gh.factory<_i28.IUserController>(
      () => _i28.UserController(get<_i15.IUserRemoteRepository>()));
  gh.factory<_i29.IWishlistController>(
      () => _i29.WishlistController(get<_i17.IWishlistRepository>()));
  gh.factory<_i30.SocialBloc>(() => _i30.SocialBloc(
      get<_i26.ISocialAuthRepository>(), get<_i31.ISessionManager>()));
  gh.factory<_i32.UserBloc>(() =>
      _i32.UserBloc(get<_i28.IUserController>(), get<_i12.ISessionManager>()));
  gh.factory<_i33.WishlistBloc>(
      () => _i33.WishlistBloc(get<_i29.IWishlistController>()));
  gh.factory<_i34.AddressBloc>(
      () => _i34.AddressBloc(get<_i20.IAddressController>()));
  gh.factory<_i35.CartBloc>(() => _i35.CartBloc(get<_i23.ICartController>()));
  gh.factory<_i36.IAuthLoginController>(() => _i36.AuthLoginController(
      get<_i21.IAuthRemoteRepository>(),
      get<_i12.ISessionManager>(),
      get<_i7.IAppManager>()));
  gh.factory<_i37.IChatController>(() => _i37.ChatController(
      get<_i24.IChatRepository>(), get<_i12.ISessionManager>()));
  gh.factory<_i38.LoginBloc>(() => _i38.LoginBloc(
      get<_i36.IAuthLoginController>(), get<_i12.ISessionManager>()));
  gh.factory<_i39.RegisterBloc>(() => _i39.RegisterBloc(
      get<_i36.IAuthLoginController>(), get<_i12.ISessionManager>()));
  gh.factory<_i40.ResetPasswordBloc>(
      () => _i40.ResetPasswordBloc(get<_i36.IAuthLoginController>()));
  gh.factory<_i41.VerifyOtpBloc>(() => _i41.VerifyOtpBloc(
      get<_i36.IAuthLoginController>(), get<_i12.ISessionManager>()));
  gh.factory<_i42.BiometricBloc>(() => _i42.BiometricBloc(
      get<_i31.IAuthRemoteRepository>(),
      get<_i31.ISessionManager>(),
      get<_i36.IAuthLoginController>(),
      get<_i31.IAppManager>()));
  gh.factory<_i43.ChangeForgotPasswordBloc>(() => _i43.ChangeForgotPasswordBloc(
      get<_i36.IAuthLoginController>(), get<_i12.ISessionManager>()));
  gh.factory<_i44.ChatBloc>(() => _i44.ChatBloc(get<_i37.IChatController>()));
  return get;
}
