part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class CurrentUserEvent extends UserEvent {
  final bool needGetFromServer;
  CurrentUserEvent(this.needGetFromServer);
}

final class UpdateUserEvent extends UserEvent { 
  final String key;
  final String value;
  UpdateUserEvent(this.key, this.value);
}