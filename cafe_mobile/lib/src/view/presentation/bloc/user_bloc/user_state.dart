part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class InitialUserState extends UserState {}

final class LoadingUserState extends UserState {}

final class SuccessUserState extends UserState {
  final UserModel userModel;
  SuccessUserState(this.userModel);
}

final class SuccessGetAddressUserState extends UserState {
  final GeocodingModel geocodingModel;
  SuccessGetAddressUserState(this.geocodingModel);
}

final class FailUserState extends UserState {
  final String error;
  FailUserState(this.error);
}
