part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

 
}

class PerformLogin extends AuthEvent{

 String? email;
 String? password; 

PerformLogin({
    required this.email,
    required this.password,
  }
  );

 @override
  List<Object?> get props => [email , password];

  String toString()  => 'PerformLogin {username: $email , password: $password}';
}
