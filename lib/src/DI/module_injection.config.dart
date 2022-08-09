// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_rest_client/flutter_rest_client.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i16;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

import '../../super_module.dart' as _i34;
import '../core/service/fcm_service.dart' as _i3;
import '../features/address/data/repository/address_repository.dart' as _i5;
import '../features/address/domain/controller/i_address_controller.dart'
    as _i22;
import '../features/address/domain/repository/i_address_repository.dart' as _i4;
import '../features/address/presentation/bloc/address_bloc.dart' as _i37;
import '../features/auth/biometric/bloc/biometric_bloc.dart' as _i46;
import '../features/auth/data/repositories/auth_remote_repository.dart' as _i24;
import '../features/auth/domain/controller/auth_login_controller.dart' as _i40;
import '../features/auth/domain/repositories/i_auth_remote_repository.dart'
    as _i23;
import '../features/auth/presentation/bloc/forgot_password_bloc/change_forgot_password_bloc/change_forgot_password_bloc.dart'
    as _i47;
import '../features/auth/presentation/bloc/forgot_password_bloc/reset_password_bloc/reset_password_bloc.dart'
    as _i44;
import '../features/auth/presentation/bloc/forgot_password_bloc/verify_opt_bloc/verify_otp_bloc.dart'
    as _i45;
import '../features/auth/presentation/bloc/login_bloc/login_bloc.dart' as _i42;
import '../features/auth/presentation/bloc/register_bloc/register_bloc.dart'
    as _i43;
import '../features/auth/presentation/bloc/register_phone_by_otp_bloc/register_phone_by_otp_bloc.dart'
    as _i21;
import '../features/auth/social/data/repository/i_social_repository.dart'
    as _i29;
import '../features/auth/social/data/repository/social_auth_repository.dart'
    as _i30;
import '../features/auth/social/presentation/social_bloc.dart' as _i33;
import '../features/cart/data/repositories/cart_repositories.dart' as _i11;
import '../features/cart/domain/controller/cart_controller.dart' as _i25;
import '../features/cart/domain/repositories/i_cart_repositories.dart' as _i10;
import '../features/cart/presentation/bloc/cart_bloc.dart' as _i38;
import '../features/chat/data/repositories/chat_repository.dart' as _i27;
import '../features/chat/domain/controller/chat_controller.dart' as _i41;
import '../features/chat/domain/repositories/i_chat_repository.dart' as _i26;
import '../features/chat/presentation/bloc/chat_bloc.dart' as _i48;
import '../features/firebase/data/repositories/firebase_repository.dart'
    as _i13;
import '../features/firebase/domain/controller/firebase_controller.dart'
    as _i28;
import '../features/firebase/domain/repositories/i_firebase_repository.dart'
    as _i12;
import '../features/firebase/presentation/bloc/firebase_bloc.dart' as _i39;
import '../features/user/data/repositories/user_remote_repostiory.dart' as _i18;
import '../features/user/data/session/app_manager.dart' as _i8;
import '../features/user/data/session/i_app_manager.dart' as _i7;
import '../features/user/data/session/i_session_manager.dart' as _i14;
import '../features/user/data/session/session_manager.dart' as _i15;
import '../features/user/domain/controller/user_controller.dart' as _i31;
import '../features/user/domain/repositories/i_user_remote_repository.dart'
    as _i17;
import '../features/user/presentation/bloc/user_bloc.dart' as _i35;
import '../features/wishlist/data/repositories/wishlist_repositories.dart'
    as _i20;
import '../features/wishlist/domain/controller/wishlist_controller.dart'
    as _i32;
import '../features/wishlist/domain/repositories/i_wishlist_repositories.dart'
    as _i19;
import '../features/wishlist/presentation/bloc/wishlist_bloc.dart'
    as _i36; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i12.IFirebaseRepository>(() => _i13.FirebaseRepository());
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
  gh.factory<_i26.IChatRepository>(
      () => _i27.ChatRepository(get<_i14.ISessionManager>()));
  gh.factory<_i28.IFirebaseController>(
      () => _i28.FirebaseController(get<_i12.IFirebaseRepository>()));
  gh.factory<_i29.ISocialAuthRepository>(
      () => _i30.SocialAuthRepository(get<_i23.IAuthRemoteRepository>()));
  gh.factory<_i31.IUserController>(
      () => _i31.UserController(get<_i17.IUserRemoteRepository>()));
  gh.factory<_i32.IWishlistController>(
      () => _i32.WishlistController(get<_i19.IWishlistRepository>()));
  gh.factory<_i33.SocialBloc>(() => _i33.SocialBloc(
      get<_i29.ISocialAuthRepository>(), get<_i34.ISessionManager>()));
  gh.factory<_i35.UserBloc>(() =>
      _i35.UserBloc(get<_i31.IUserController>(), get<_i14.ISessionManager>()));
  gh.factory<_i36.WishlistBloc>(
      () => _i36.WishlistBloc(get<_i32.IWishlistController>()));
  gh.factory<_i37.AddressBloc>(
      () => _i37.AddressBloc(get<_i22.IAddressController>()));
  gh.factory<_i38.CartBloc>(() => _i38.CartBloc(get<_i25.ICartController>()));
  gh.factory<_i39.FirebaseBloc>(
      () => _i39.FirebaseBloc(get<_i28.IFirebaseController>()));
  gh.factory<_i40.IAuthLoginController>(() => _i40.AuthLoginController(
      get<_i23.IAuthRemoteRepository>(),
      get<_i14.ISessionManager>(),
      get<_i7.IAppManager>()));
  gh.factory<_i41.IChatController>(() => _i41.ChatController(
      get<_i26.IChatRepository>(), get<_i14.ISessionManager>()));
  gh.factory<_i42.LoginBloc>(() => _i42.LoginBloc(
      get<_i40.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i43.RegisterBloc>(() => _i43.RegisterBloc(
      get<_i40.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i44.ResetPasswordBloc>(
      () => _i44.ResetPasswordBloc(get<_i40.IAuthLoginController>()));
  gh.factory<_i45.VerifyOtpBloc>(() => _i45.VerifyOtpBloc(
      get<_i40.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i46.BiometricBloc>(() => _i46.BiometricBloc(
      get<_i34.IAuthRemoteRepository>(),
      get<_i34.ISessionManager>(),
      get<_i40.IAuthLoginController>(),
      get<_i34.IAppManager>()));
  gh.factory<_i47.ChangeForgotPasswordBloc>(() => _i47.ChangeForgotPasswordBloc(
      get<_i40.IAuthLoginController>(), get<_i14.ISessionManager>()));
  gh.factory<_i48.ChatBloc>(() => _i48.ChatBloc(get<_i41.IChatController>()));
  return get;
}
