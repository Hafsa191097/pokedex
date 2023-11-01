import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokemondata_state.dart';

class PokemondataCubit extends Cubit<PokemondataState> {

  bool isLoading;
  PokemondataCubit({this.isLoading = false}) : super(PokemondataInitial());

  void changeLoading(bool value){
    isLoading = value;
    emit(PokemondataInitial());
  }

  void getPokemonData() async {
    emit(PokemondataLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(PokemondataLoaded());
  }

  void getPokemonError() async {
    emit(PokemondataLoading());
    await Future.delayed(Duration(seconds: 2));
    emit(PokemondataError("Error"));
  }

}
