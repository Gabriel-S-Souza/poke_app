import 'package:flutter/material.dart';

import '../../../../../core/utils/string_extension.dart';
import '../../../domain/entities/poke_type.dart';

class TypeTagsWidget extends StatelessWidget {
  final List<PokeType> types;

  const TypeTagsWidget({super.key, required this.types});

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: types
            .map(
              (type) => Container(
                height: 22,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  color: Color(type.hexColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  type.toString().split('.').last.capitalize(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
            )
            .toList(),
      );
}
