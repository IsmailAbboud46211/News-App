part of 'internet_cubit.dart';

sealed class InternetState {}

final class InternetInitial extends InternetState {}

final class InternetConnected extends InternetState {}

final class InternetDisconnected extends InternetState {}
