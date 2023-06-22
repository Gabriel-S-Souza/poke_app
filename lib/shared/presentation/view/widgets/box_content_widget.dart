import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class BoxContentWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;
  final Widget? child;

  const BoxContentWidget({
    super.key,
    this.width,
    this.height,
    this.padding,
    this.clipBehavior = Clip.none,
    this.child,
  });

  @override
  Widget build(BuildContext context) => Container(
        padding: padding,
        width: width,
        height: height,
        clipBehavior: clipBehavior,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              spreadRadius: 4,
              color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
              inset: true,
            ),
          ],
        ),
        child: child,
      );
}
