// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_rest_client/flutter_rest_client.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../super_module.dart' as _i32;
import '../core/service/fcm_service.dart' as _i3;
import '../features/address/data/repository/address_repository.dart' as _i5;
import '../features/address/domain/controller/i_address_controller.dart'
    as _i22;
import '../features/address/domain/repository/i_address_repository.dart' as _i4;
import '../features/address/presentation/bloc/address_bloc.dart' as _i35;
import '../features/auth/biometric/bloc/biometric_bloc.dart' as _i43;
import '../features/auth/data/repositories/auth_remote_repository.dart' as _i24;
import '../features/auth/domain/controller/auth_login_controller.dart' as _i38;
import '../features/auth/domain/repositories/i_auth_remote_repository.dart'
    as _i23;
import '../features/auth/presentation/bloc/forgot_password_bloc/change_forgot_password_bloc/change_forgot_password_bloc.dart'
    as _i44;
import '../features/auth/presentation/bloc/forgot_password_bloc/reset_password_bloc/reset_password_bloc.dart'
    as _i41;
import '../features/auth/presentation/bloc/forgot_password_bloc/verify_opt_bloc/verify_otp_bloc.dart'
    as _i42;
import '../features/auth/presentation/bloc/login_bloc/login_bloc.dart' as _i39;
import '../features/auth/presentation/bloc/register_bloc/register_bloc.dart'
    as _i40;
import '../features/auth/presentation/bloc/register_phone_by_otp_bloc/register_phone_by_otp_bloc.dart'
    as _i21;
import '../features/auth/social/data/repository/i_social_repository.dart'
    as _i27;
import '../features/auth/social/data/repository/social_auth_repository.dart'
    as _i28;
import '../features/auth/social/presentation/social_bloc.dart' as _i31;
import '../features/cart/data/repositories/cart_repositories.dart' as _i11;
import '../features/cart/domain/controller/cart_controller.dart' as _i25;
import '../features/cart/domain/repositories/i_cart_repositories.dart' as _i10;
import '../features/cart/presentation/bloc/cart_bloc.dart' as _i36;
import '../features/chat/data/repositories/chat_repository.dart' as _i13;
import '../features/chat/domain/controller/chat_controller.dart' as _i26;
import '../features/chat/domain/repositories/i_chat_repository.dart' as _i12;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i37;
import '../features/user/data/repositories/user_remote_repostiory.dart' as _i18;
import '../features/user/data/session/app_manager.dart' as _i8;
import '../features/user/data/session/i_app_manager.dart' as _i7;
import '../features/user/data/session/i_session_manager.dart' as _i14;
import '../features/user/data/session/session_manager.dart' as _i15;
import '../features/user/domain/controller/user_controller.dart' as _i29;
import '../features/user/domain/repositories/i_user_remote_repository.dart'
    as _i17;
import '../features/user/presentation/bloc/user_bloc.dart' as _i33;
import '../features/wishlist/data/repositories/wishlist_repositories.dart'
    as _i20;
import '../features/wishlist/domain/controller/wishlist_controller.dart'
    as _i30;
import '../features/wishlist/domain/repositories/i_wishlist_repositories.dart'
    as _i19;
import '../features/wishlist/presentation/bloc/wishlist_bloc.dart'
    as _i34; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i12.IChatRepository>(
      () => _i13.ChatRepository(get<_i6.IHttpConfig>()));
  gh.factory<_i14.ISessionManager>(
      () => _i15.SessionManager(get<_i16.FlutterSecureStorage>()));
  gh.factory<_i17.IUserRemoteRepository>(() => _i18.UserRemoteRepository(
      get<_i6.IHttpHelper>(), get<_i14.ISessionManager>()));
  gh.factory<_i19.IWishlistRepository>(
      () => _i20.WishlistRepositories(get<_i6.IHttpHelper>()));
  gh.factory<_i21.RegisterPhoneByOtpBloc>(() => _i21.RegisterPhoneByOtpBloc());
  gh.factory<_i22.IAddressController>(
      () => _i22.CheckoutController(get<_i4.IAddressRepository>()));
  gh.factory<_i23.IAuthRemoteRepository>(() => _i24.AuthRemoteRepository(
      get<_i6.IHttpHelper>(), get<_i14.ISessionManager>()));
  gh.factory<_i25.ICartController>(
      () => _i25.CartController(get<_i10.ICartRepository>()));
  gh.factory<_i26.IChatController>(() => _i26.ChatController(
      get<_i12.IChatRepository>(), get<_i14.ISessionManager>()));
  gh.factory<_i27.ISocialAuthRepository>(
      () => _i28.SocialAuthRepository(get<_i23.IAuthRemoteRepository>()));
  gh.factory<_i29.IUserController>(
      () => _i29.UserController(get<_i17.IUserRemoteRepository>()));
  gh.factory<_i30.IWishlistController>(
      () => _i30.WishlistController(get<_i19.IWishlistRepository>()));
  gh.factory<_i31.SocialBloc>(() => _i31.SocialBloc(
      get<_i27.ISocialAuthRepository>(), get<_i32.ISessionManager>()));
  gh.factory<_i33.UserBloc>(() =>
      _i33.UserBloc(get<_i29.IUserController>(), get<_i14.ISessionManager>()));
  gh.factory<_i34.WishlistBloc>(
      () => _i34.WishlistBloc(get<_i30.IWishlistController>()));
  gh.factory<_i35.AddressBloc>(
      () => _i35.AddressBloc(get<_i22.IAddressController>()));
  gh.factory<_i36.CartBloc>(() => _i36.CartBloc(get<_i25.ICartController>()));
  gh.factory<_i37.ChatBloc>(() => _i37.ChatBloc(get<_i26.IChatController>()));
  gh.factory<_i38.IAuthLoginController>(() => _i38.AuthLoginController(
      get<_i23.IAuthRemoteRepository>(),
      get<_i14.ISessionManager>(),
      get<_i7.IAppManager>()));
  gh.factory<_i39.LoginBloc>(() => _i39.LoginBloc(
      get<_i38.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i40.RegisterBloc>(() => _i40.RegisterBloc(
      get<_i38.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i41.ResetPasswordBloc>(
      () => _i41.ResetPasswordBloc(get<_i38.IAuthLoginController>()));
  gh.factory<_i42.VerifyOtpBloc>(() => _i42.VerifyOtpBloc(
      get<_i38.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i43.BiometricBloc>(() => _i43.BiometricBloc(
      get<_i32.IAuthRemoteRepository>(),
      get<_i32.ISessionManager>(),
      get<_i38.IAuthLoginController>(),
      get<_i32.IAppManager>()));
  gh.factory<_i44.ChangeForgotPasswordBloc>(() => _i44.ChangeForgotPasswordBloc(
      get<_i38.IAuthLoginController>(), get<_i14.ISessionManager>()));
  return get;
}
