part of 'pokemondata_cubit.dart';

sealed class PokemondataState extends Equatable {
  const PokemondataState();

  @override
  List<Object> get props => [];
}

final class PokemondataInitial extends PokemondataState {}

final class PokemondataLoading extends PokemondataState {}

final class PokemondataLoaded extends PokemondataState {}

final class PokemondataError extends PokemondataState {
  final String message;

  PokemondataError(this.message);

  @override
  List<Object> get props => [message];
}