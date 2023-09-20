import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<PerformLogin>((event, emit) async{
      try{
      emit(AuthLoginLoading());
      var response = await http.post(Uri.parse("https://mdp8iymaik.execute-api.us-east-2.amazonaws.com/prod/auth/login"),
      headers: {'content-type': 'application/json'},
       body: jsonEncode({'Email__c': event.email, 'Password': event.password}),);
       print(response.body);
      if(response.statusCode == 200)
      {
        String result = response.body;
        if(result != null){
          emit(AuthLoginSuccess());
        }
         }

      }catch(e){
        print(e);
          emit(AuthErrorState(e.toString()));
      }
    });
  }
}
