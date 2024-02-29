part of 'signup_cubit.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

class ChangePasswordVisibility extends SignUpState {}

class ChangeRePasswordVisibility extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {}

class SignUpError extends SignUpState {}

class CreateUserLoading extends SignUpState {}

class CreateUserSuccess extends SignUpState {}

class CreateUserError extends SignUpState {}
