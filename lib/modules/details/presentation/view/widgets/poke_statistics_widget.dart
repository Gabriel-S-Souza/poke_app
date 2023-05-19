import 'package:flutter/material.dart';

import '../../../../../core/theme/theme.dart';
import '../../../domain/entities/poke_statistics_entity.dart';

class PokeStatisticsWidget extends StatelessWidget {
  final List<PokeStatisticEntity> statistics;
  final Color valueBarColor;

  const PokeStatisticsWidget({
    super.key,
    required this.statistics,
    this.valueBarColor = AppColors.primaryColor,
  });

  @override
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: statistics
            .map(
              (statistic) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        statistic.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Expanded(
                      flex: 5,
                      child: Row(
                        children: [
                          Text(
                            statistic.value.toString(),
                            textAlign: TextAlign.right,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Expanded(
                            child: LinearProgressIndicator(
                              value: statistic.value / 255,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                valueBarColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      );
}
