import 'package:flutter/material.dart';

class RadioTileWidget<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?>? onChanged;
  final String title;

  const RadioTileWidget({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.title,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        child: GestureDetector(
          child: InkWell(
            highlightColor: Colors.transparent,
            onTap: () => onChanged?.call(value),
            child: Row(
              children: [
                Radio<T>(
                  value: value,
                  groupValue: groupValue,
                  onChanged: onChanged,
                  visualDensity: VisualDensity.compact,
                ),
                Flexible(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

enum SortPokeBy { name, number }
