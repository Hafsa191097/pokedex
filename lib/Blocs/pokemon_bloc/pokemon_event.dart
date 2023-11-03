part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class GetPokemonNameEvent extends PokemonEvent{}

class CharacterFeaturesEvent extends PokemonEvent{
  final String url;
  CharacterFeaturesEvent(this.url);
}