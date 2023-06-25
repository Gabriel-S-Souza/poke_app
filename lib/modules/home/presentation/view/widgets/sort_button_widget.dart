import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import '../../../../../core/utils/assets.dart';
import 'circle_button_widget.dart';
import 'radio_tile_widget.dart';
import 'sort_poke_dialog.dart';

class SortButtonWidget extends StatefulWidget {
  final void Function(SortPokeBy)? onSelected;
  final SortPokeBy currentSortBy;

  const SortButtonWidget({
    super.key,
    this.onSelected,
    this.currentSortBy = SortPokeBy.number,
  });

  @override
  State<SortButtonWidget> createState() => _SortButtonWidgetState();
}

class _SortButtonWidgetState extends State<SortButtonWidget> {
  @override
  Widget build(BuildContext context) => CircleButtonWidget(
        child: widget.currentSortBy == SortPokeBy.number
            ? Image.asset(
                Assets.hash,
                height: 24,
                color: Theme.of(context).colorScheme.primary,
              )
            : Image.asset(
                Assets.textFormat,
                height: 24,
                color: Theme.of(context).colorScheme.primary,
              ),
        onPressed: () {
          final renderBox = context.findRenderObject() as RenderBox;
          Navigator.of(context).push(
            DialogRoute(
              barrierDismissible: true,
              barrierColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.6),
              context: context,
              builder: (context) => SortPokeDialog(
                renderBox: renderBox,
                onSelected: widget.onSelected,
                currentSortBy: widget.currentSortBy,
              ),
            ),
          );
        },
      );
}
