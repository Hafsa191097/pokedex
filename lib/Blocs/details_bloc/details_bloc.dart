
import 'package:Pokedex/data/repository/abilities_client.dart';
import 'package:Pokedex/data/repository/features_client.dart';
import 'package:Pokedex/Models/pokemon.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/repository/characteristic_client.dart';

part 'details_event.dart';
part 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {

  AbilitiesClient abilitiesClient=AbilitiesClient();
  Iterable<Abilities> abilities=[];

  CharacteristicClient characteristicClient=CharacteristicClient();
  Iterable<Types>? types=[];

  FeaturesClient featuresClient=FeaturesClient();
   List<int> features=[];

  DetailsBloc() : super(DetailsInitial()) {
    on<DetailsEvent>((event, emit) {});

    on<GetDetailsEvent>((event,emit)async{
      emit(LoadingState(true));

     abilities=await abilitiesClient.getAbilities(event.url);
     types=await characteristicClient.getTypes(event.url);
     features=await featuresClient.getFeatures(event.url);

      emit(LoadingState(false));

      emit(CharacterFeaturesState(
          abilities: abilities,
          types: types!,
          features: features));
    });

  }
}
