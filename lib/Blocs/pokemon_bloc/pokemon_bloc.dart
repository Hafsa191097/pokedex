import 'package:Pokedex/Models/results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/pokemon_client.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  PokemonClient pokemonRepository=PokemonClient();
  List<Results>? pokemonNameList=[];



  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {});

    on<GetPokemonNameEvent>((event,emit)async{
      pokemonNameList=await pokemonRepository.getFetch();
      emit(GetPokemonNameState(pokemonList: pokemonNameList!));
    });

    

  }


}