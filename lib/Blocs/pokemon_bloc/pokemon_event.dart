part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class GetPokemonNameEvent extends PokemonEvent{}

class GetLikesEvent extends PokemonEvent{}

class GetLikesLoading extends PokemonEvent{}

class GetLikesError extends PokemonEvent{
  final e;
  GetLikesError(String string, { required this.e});
}

