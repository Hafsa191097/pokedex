import 'package:Pokedex/services/auth.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  void changeLoading(bool value){
    emit(AuthenticationInitial());
  }

  void loginUser(String email, String password) async {
    emit(AuthenticationLoading());
    try{
      User? user = await AuthService().emailLogin(email, password);
      emit(AuthenticationSuccess(user!));
    }catch(e){
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void logoutUser() async {
    try{
      emit(AuthenticationLoading());
      await AuthService().signOut();
      emit(AuthenticationLogout());
    } catch(e){
      emit(AuthenticationFailure(e.toString()));
    }
  }

  void createUser(String email, String password) async {
    try{
      emit(AuthenticationLoading());
      User? user = await AuthService().registerUser(email, password);
      emit(AuthenticationSuccess(user!));
    }catch(e){
      emit(AuthenticationFailure(e.toString()));
    }
  }
}