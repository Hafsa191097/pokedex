part of 'authentication_cubit.dart';
sealed class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

final class AuthenticationInitial extends AuthenticationState {}

final class AuthenticationLoading extends AuthenticationState {}

final class AuthenticationLogout extends AuthenticationState {}

final class AuthenticationSuccess extends AuthenticationState {
  final User user;

  AuthenticationSuccess(this.user);

  @override
  List<Object> get props => [user];
}

final class AuthenticationFailure extends AuthenticationState {
  final String message;

  AuthenticationFailure(this.message);

  @override
  List<Object> get props => [message];
}