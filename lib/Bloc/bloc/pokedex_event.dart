part of 'pokedex_bloc.dart';

abstract class PokedexEvent extends Equatable {
  const PokedexEvent();

  @override
  List<Object> get props => [];

  int get pageindex => pageindex;
}

class PokedexPageRequest extends PokedexEvent{
  final int pageindex;

  const PokedexPageRequest({required this.pageindex});

}
