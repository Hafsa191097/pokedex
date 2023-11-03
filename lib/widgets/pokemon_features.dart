
import 'package:Pokedex/Views/home/character_detail_page.dart';
import 'package:Pokedex/widgets/features_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokemonFeatures extends StatelessWidget {
  const PokemonFeatures({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CharacterDetailPage widget;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
              child: Image.asset(widget.pokemon, height: 260.h)),
          FeaturesCard(name: widget.name, pokemon: widget.pokemon),
        ],
      ),
    );
  }
}