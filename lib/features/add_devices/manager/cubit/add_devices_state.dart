part of 'add_devices_cubit.dart';

@immutable
sealed class AddDevicesState {}

final class AddDevicesInitial extends AddDevicesState {}

final class AddDevicesLoading extends AddDevicesState {}

final class AddDevicesSuccess extends AddDevicesState {}

final class AddDevicesError extends AddDevicesState {}
