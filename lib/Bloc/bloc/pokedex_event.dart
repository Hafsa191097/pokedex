part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object> get props => [];

  // ignore: recursive_getters
  int get pageindex => pageindex;
}

class PokedexPageRequest extends PokedexEvent{
  @override
  final int pageindex;

  const PokedexPageRequest({required this.pageindex});

}
