part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class CurrentUserEvent extends UserEvent {
  final bool needGetFromServer;
  CurrentUserEvent(this.needGetFromServer);
}

final class UpdateUserEvent extends UserEvent { 
  // final String key;
  // final String value;
  final Map<String, dynamic> data;
  UpdateUserEvent(this.data);
}

final class GetAddressUserEvent extends UserEvent { 
  final double lat;
  final double lon;
  GetAddressUserEvent(this.lat, this.lon);
}