import 'package:flutter/material.dart';

import '../../../../../shared/presentation/view/widgets/box_content_widget.dart';
import 'radio_tile_widget.dart';

class SortPokeDialog extends StatefulWidget {
  final RenderBox renderBox;
  final double? left;
  final double? top;
  final double? right;
  final double? bottom;
  final AlignmentGeometry alignment;
  final void Function(SortPokeBy)? onSelected;
  final SortPokeBy currentSortBy;

  const SortPokeDialog({
    super.key,
    required this.renderBox,
    this.left,
    this.top,
    this.right = 16.0,
    this.bottom,
    this.alignment = AlignmentDirectional.topStart,
    this.onSelected,
    this.currentSortBy = SortPokeBy.number,
  });

  @override
  State<SortPokeDialog> createState() => _SortPokeDialogState();
}

class _SortPokeDialogState extends State<SortPokeDialog> {
  late RenderBox renderBox;
  late Offset offset;
  late double offsetTop;

  late SortPokeBy sortBy;

  @override
  void initState() {
    super.initState();
    renderBox = widget.renderBox;
    sortBy = widget.currentSortBy;
  }

  void selectSortBy(SortPokeBy? value) async {
    if (value == null || value == sortBy) return;
    setState(() {
      sortBy = value;
    });
    widget.onSelected?.call(value);
    await Future.delayed(const Duration(milliseconds: 100));
    if (mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    offset = renderBox.localToGlobal(Offset.zero);
    offsetTop = offset.dy + 16;

    return Stack(
      alignment: widget.alignment,
      children: [
        Positioned(
          top: offsetTop,
          left: widget.left,
          bottom: widget.bottom,
          right: widget.right,
          child: Material(
            color: Colors.transparent,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            child: SizedBox(
              width: 144,
              height: 170,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 16, 24, 14),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      child: Text('Sort by:', style: Theme.of(context).textTheme.headlineSmall),
                    ),
                  ),
                  Flexible(
                    flex: 5,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(12).copyWith(
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                        ),
                      ),
                      child: BoxContentWidget(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              radioTheme: RadioThemeData(
                                fillColor: MaterialStateProperty.all<Color>(
                                  Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RadioTileWidget<SortPokeBy>(
                                  value: SortPokeBy.number,
                                  groupValue: sortBy,
                                  title: 'Number',
                                  onChanged: selectSortBy,
                                ),
                                const SizedBox(width: 8),
                                RadioTileWidget<SortPokeBy>(
                                  value: SortPokeBy.name,
                                  groupValue: sortBy,
                                  title: 'Name',
                                  onChanged: selectSortBy,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
