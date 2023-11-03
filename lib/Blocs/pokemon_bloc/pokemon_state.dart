part of 'pokemon_bloc.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

// ignore: must_be_immutable
class GetPokemonNameState extends PokemonState{
  List<Results> pokemonList=[];

  GetPokemonNameState({required this.pokemonList});
}

