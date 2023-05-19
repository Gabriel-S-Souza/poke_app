import 'package:auto_size_text/auto_size_text.dart';
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
  Widget build(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
              statistics.length,
              (index) => SizedBox(
                width: 32,
                height: 18.0,
                child: AutoSizeText(
                  _getShortStatsName(statistics[index].name),
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        color: valueBarColor,
                      ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Container(
            color: Theme.of(context).colorScheme.tertiary,
            width: 1.2,
            height: 18.0 * statistics.length - 4.0,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                statistics.length,
                (index) => SizedBox(
                  height: 18.0,
                  child: Row(
                    children: [
                      Text(
                        _statValueFormatted(statistics[index].value),
                        textAlign: TextAlign.right,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      const SizedBox(width: 8.0),
                      Expanded(
                        child: Container(
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: LinearProgressIndicator(
                            value: statistics[index].value / 255,
                            backgroundColor: valueBarColor.withOpacity(0.22),
                            valueColor: AlwaysStoppedAnimation<Color>(valueBarColor),
                            minHeight: 4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );

  String _getShortStatsName(String name) {
    switch (name) {
      case 'hp':
        return 'HP';
      case 'attack':
        return 'ATK';
      case 'defense':
        return 'DEF';
      case 'special-attack':
        return 'SATK';
      case 'special-defense':
        return 'SDEF';
      case 'speed':
        return 'SPD';
      default:
        return name.length > 3 ? name.substring(0, 3).toUpperCase() : name.toUpperCase();
    }
  }

  String _statValueFormatted(int value) => value.toString().padLeft(3, '0');
}
