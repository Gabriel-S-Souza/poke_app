import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class PokeFloatingImageWidget extends StatelessWidget {
  final int pokemonId;
  final String? imageUrl;
  final VoidCallback? onLeftPressed;
  final VoidCallback? onRightPressed;
  final BoxConstraints constraints;
  final bool isLoading;

  const PokeFloatingImageWidget({
    super.key,
    required this.pokemonId,
    required this.imageUrl,
    required this.constraints,
    this.onLeftPressed,
    this.onRightPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) => Positioned(
        width: constraints.maxWidth - 8,
        top: constraints.maxHeight * 0.092 - MediaQuery.of(context).padding.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: pokemonId > 1 && !isLoading,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Transform.translate(
                  offset: Offset(0, constraints.maxHeight * 0.024),
                  child: IconButton(
                    onPressed: onLeftPressed,
                    icon: Image.asset(
                      Assets.arrowLeft,
                      width: 38,
                      height: 38,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: constraints.maxHeight * 0.31 - MediaQuery.of(context).padding.vertical,
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Image.network(
                        imageUrl!,
                        fit: BoxFit.contain,
                        errorBuilder: (_, __, ___) => const Icon(Icons.error),
                      ),
              ),
              Visibility(
                visible: pokemonId < 1281 && !isLoading,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Transform.translate(
                  offset: Offset(0, constraints.maxHeight * 0.024),
                  child: IconButton(
                    onPressed: onRightPressed,
                    icon: Image.asset(
                      Assets.arrowRight,
                      width: 38,
                      height: 38,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
