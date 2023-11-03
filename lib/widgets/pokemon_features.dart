
import 'package:Pokedex/Views/home/character_detail_page.dart';
import 'package:Pokedex/widgets/features_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonFeatures extends StatefulWidget {
  const PokemonFeatures({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CharacterDetailPage widget;

  @override
  State<PokemonFeatures> createState() => _PokemonFeaturesState();
}

class _PokemonFeaturesState extends State<PokemonFeatures> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
              child: Image.network(widget.widget.pokemon , height: 260.h)
              // child: Image.network(widget.widget.pokemon,height: 260.h,),
              ),
              
              FeaturesCard(name: widget.widget.name, pokemon: widget.widget.pokemon),
        ],
      ),
    );
  }
  

}