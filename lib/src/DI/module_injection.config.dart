// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:rest_client/rest_client.dart';

import '../auth/data/repositories/auth_remote_repository.dart';
import '../auth/biometric/bloc/biometric_bloc.dart';
import '../auth/presentation/bloc/forgot_password_bloc/change_forgot_password_bloc/change_forgot_password_bloc.dart';
import '../auth/domain/controller/auth_login_controller.dart';
import '../auth/domain/repositories/i_auth_remote_repository.dart';
import '../../super_module.dart';
import '../user/data/session/i_session_manager.dart' as super_module;
import '../auth/social/data/repository/i_social_repository.dart';
import '../user/domain/controller/user_controller.dart';
import '../user/domain/repositories/i_user_remote_repository.dart';
import '../auth/presentation/bloc/login_bloc/login_bloc.dart';
import '../auth/presentation/bloc/register_bloc/register_bloc.dart';
import '../auth/presentation/bloc/register_phone_by_otp_bloc/register_phone_by_otp_bloc.dart';
import '../auth/presentation/bloc/forgot_password_bloc/reset_password_bloc/reset_password_bloc.dart';
import '../user/data/session/session_manager.dart';
import '../auth/social/data/repository/social_auth_repository.dart';
import '../auth/social/presentation/social_bloc.dart';
import '../user/presentation/bloc/user_bloc.dart';
import '../user/data/repositories/user_remote_repostiory.dart';
import '../auth/presentation/bloc/forgot_password_bloc/verify_opt_bloc/verify_otp_bloc.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initModuleGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<super_module.ISessionManager>(
      () => SessionManager(get<FlutterSecureStorage>()));
  gh.factory<IUserRemoteRepository>(() => UserRemoteRepository(
      get<IHttpHelper>(), get<super_module.ISessionManager>()));
  gh.factory<RegisterPhoneByOtpBloc>(() => RegisterPhoneByOtpBloc());
  gh.factory<IAuthRemoteRepository>(() => AuthRemoteRepository(
      get<IHttpHelper>(), get<super_module.ISessionManager>()));
  gh.factory<ISocialAuthRepository>(
      () => SocialAuthRepository(get<IAuthRemoteRepository>()));
  gh.factory<IUserController>(
      () => UserController(get<IUserRemoteRepository>()));
  gh.factory<SocialBloc>(
      () => SocialBloc(get<ISocialAuthRepository>(), get<ISessionManager>()));
  gh.factory<UserBloc>(() => UserBloc(get<IUserController>()));
  gh.factory<BiometricBloc>(() => BiometricBloc(
      get<IAuthRemoteRepository>(), get<super_module.ISessionManager>()));
  gh.factory<IAuthLoginController>(() => AuthLoginController(
      get<IAuthRemoteRepository>(), get<super_module.ISessionManager>()));
  gh.factory<LoginBloc>(() => LoginBloc(
      get<IAuthLoginController>(), get<super_module.ISessionManager>()));
  gh.factory<RegisterBloc>(() => RegisterBloc(
      get<IAuthLoginController>(), get<super_module.ISessionManager>()));
  gh.factory<ResetPasswordBloc>(
      () => ResetPasswordBloc(get<IAuthLoginController>()));
  gh.factory<VerifyOtpBloc>(() => VerifyOtpBloc(
      get<IAuthLoginController>(), get<super_module.ISessionManager>()));
  gh.factory<ChangeForgotPasswordBloc>(() => ChangeForgotPasswordBloc(
      get<IAuthLoginController>(), get<super_module.ISessionManager>()));
  return get;
}
