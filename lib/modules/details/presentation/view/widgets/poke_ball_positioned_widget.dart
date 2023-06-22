import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class PokeBallPositionedWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  const PokeBallPositionedWidget({
    required this.constraints,
    super.key,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) => Positioned(
        right: right,
        left: left,
        top: top,
        bottom: bottom,
        child: SizedBox(
          height: constraints.maxHeight * 0.328 - MediaQuery.of(context).padding.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Image.asset(
              Assets.pokeballImg,
              fit: BoxFit.fitHeight,
              color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
            ),
          ),
        ),
      );
}
