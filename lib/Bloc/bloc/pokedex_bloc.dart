// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:Pokedex/services/NetworkRequests/pokemon_repositery.dart';
import 'package:Pokedex/services/page_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final repository = PokedexRepository();
  PokedexBloc() : super(PokedexInitial()){
    on<PokedexEvent>(((event, emit) {
      on<PokedexPageRequest>((event, emit) => emit(mapEventToState(event,emit)));
    }));
  }
   mapEventToState(PokedexPageRequest event,Emitter emit) async {
   
    emit(PokedexLoading());
    try{
      final pageresponse = await repository.getpokemon(event.pageindex);
      
      emit(PokedexLoadingSuccess(pokedexlist: pageresponse.pokemonlistings, canloadnextpage: pageresponse.canloadnext));
    }catch(e){
      emit(PokedexLoadingError(error: e));
    }
  }
  // Stream<PokedexState> mapEventToState(PokedexEvent event , Emitter<PokedexState> emit) async*{
  //   if(event is PokedexPageRequest){
  //     yield PokedexLoading();
  //     try {
  //       final pageresponse = await repository.getpokemon(event.pageindex);
  //       yield PokedexLoadingSuccess(pokedexlist: pageresponse.pokemonlistings, canloadnextpage: pageresponse.canloadnext);
  //     } catch (e) {
  //       yield PokedexLoadingError(error: e);
  //     }
  //   }
  // }
}
