// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class LoadUserRequested extends UserEvent {
  const LoadUserRequested();
}

class ChangeUsernameRequested extends UserEvent {
  final User user;
  final String newUsername;

  const ChangeUsernameRequested({
    required this.user,
    required this.newUsername,
  });

  @override
  List<Object> get props => [user, newUsername];
}
