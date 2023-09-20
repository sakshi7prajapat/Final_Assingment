part of 'auth_bloc.dart';

final class AuthState extends Equatable {
  const AuthState();
  
 @override
  List<Object> get props => [];
  
 
}

final class AuthInitial extends AuthState {
 @override
  List<Object> get props => [];
}

final class AuthLoginLoading extends AuthState {
 @override
  List<Object> get props => [];
}

final class AuthLoginSuccess extends AuthState {
 @override
  List<Object> get props => [];
}

final class AuthRegister extends AuthState {
 @override
  List<Object> get props => [];
}

final class AuthErrorState extends AuthState {
  final String errorMessage;

  AuthErrorState(this.errorMessage);
 @override
  List<Object> get props => [errorMessage];
}