part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeGetDataLoading extends HomeState {}

final class HomeGetDataSuccess extends HomeState {}

final class HomeGetDataError extends HomeState {}

final class HomesignOutLoading extends HomeState {}

final class HomesignOutSuccess extends HomeState {}

final class HomesignOutError extends HomeState {}
