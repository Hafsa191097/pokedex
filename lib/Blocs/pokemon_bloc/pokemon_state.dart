part of 'pokemon_bloc.dart';

abstract class PokemonState {}

class PokemonInitial extends PokemonState {}


class PokemonLoading extends PokemonState {}
class PokemonLikesError extends PokemonState{
  final e;
  PokemonLikesError({required this.e});
}


// ignore: must_be_immutable
class GetPokemonNameState extends PokemonState{
  List<Results> pokemonList=[];

  GetPokemonNameState({required this.pokemonList});
}

