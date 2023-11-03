import 'package:Pokedex/Models/results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/abilities_client.dart';
import '../../data/repository/pokemon_client.dart';
import '../../Models/pokemon.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {

  PokemonClient pokemonRepository=PokemonClient();
  List<Results>? pokemonNameList=[];

  AbilitiesClient abilitiesClient=AbilitiesClient();
  Iterable<Abilities>? abilities=[];



  PokemonBloc() : super(PokemonInitial()) {
    on<PokemonEvent>((event, emit) {});

    on<GetPokemonNameEvent>((event,emit)async{
      pokemonNameList=await pokemonRepository.getFetch();
      emit(GetPokemonNameState(pokemonList: pokemonNameList!));
    });

    on<CharacterFeaturesEvent>((event,emit)async{
      abilities=await abilitiesClient.getAbilities(event.url);
    });

  }


}