import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Box extends StatelessWidget {
  Box({
    required this.state,
    required this.feature,
    required this.unit,
    required this.index,
    Key? key,
  }) : super(key: key);

  var state;
  final String feature;
  final String unit;
  final int index;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius:const BorderRadius.all(Radius.circular(20))
      ),
      width: 100,
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${state.features[index]}''$unit',
              style: const TextStyle(fontSize: 21)),
          Text(feature),
        ],
      ),
    );
  }
}