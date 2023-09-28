import 'dart:convert';


import 'package:bloc/bloc.dart';
import 'package:candidate_flow/modals/login.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<PerformLogin>((event, emit) async{
      try{
      List<LoginModal> data; 
      emit(AuthLoginLoading());
      Response response = await http.post(Uri.parse("https://mdp8iymaik.execute-api.us-east-2.amazonaws.com/prod/auth/login"),
      headers: {'content-type': 'application/json'},
       body: jsonEncode({'Email__c': event.email, 'Password': event.password}),);
       print(response.body);
      if(response.body.isNotEmpty)
      {
        LoginModal loginModal = loginModalFromJson(response.body);
        if(loginModal.status == 200){
            emit(AuthLoginSuccess());
        }
      }

      }catch(e){
        print(e);
          emit(AuthErrorState(e.toString()));
      }
    }
    );

    on<RegisterEvent>((event, emit) async{
      try{
       emit(AuthLoginLoading());
      Response response = await http.post(Uri.parse("https://mdp8iymaik.execute-api.us-east-2.amazonaws.com/prod/auth/register"),
      headers: {'content-type': 'application/json'},
       body: jsonEncode({'Email__c': event.email, 'Password': event.password,
        'Phone_Number__c' : event.phoneNo
       }),);
       print(response.body);
      if(response.body.isNotEmpty)
      {
        LoginModal loginModal = loginModalFromJson(response.body);
        if(loginModal.status == 200){
            emit(AuthLoginSuccess());
        }
        //String result = response.body;
         }
      }catch(e){
          emit(AuthErrorState(e.toString()));
      }

    });

  }
}
