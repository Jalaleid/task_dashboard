part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

class ChangePasswordVisibility extends LoginState {}

class LoginLoding extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginError extends LoginState {}
