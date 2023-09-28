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

class RegisterEvent extends AuthEvent{

  String? email;
  String? password;
  String? phoneNo;

  RegisterEvent({
    required this.email,
    required this.password,
    required this.phoneNo,
  }
  );
  
  @override
  // TODO: implement props
  List<Object?> get props => [email , password , phoneNo];

   String toString()  => 'RegisterEvent {username: $email , password: $password, phoneNo: $phoneNo}';

}