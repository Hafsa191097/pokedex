part of 'pokedex_bloc.dart';

abstract class PokedexState extends Equatable {
  const PokedexState();
  
  @override
  List<Object> get props => [];
}

final class PokedexInitial extends PokedexState {}

final class PokedexLoading extends PokedexState {}

final class PokedexLoadingSuccess extends PokedexState {
  final List<PokemonList> pokedexlist;
  final bool canloadnextpage;

  const PokedexLoadingSuccess({required this.pokedexlist, required this.canloadnextpage});

}

final class PokedexLoadingError extends PokedexState {
  // ignore: prefer_typing_uninitialized_variables
  final error;

  const PokedexLoadingError({required this.error});

}
