import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CircleButtonWidget extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;

  const CircleButtonWidget({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) => Material(
        color: Theme.of(context).colorScheme.secondary,
        shape: const CircleBorder(),
        clipBehavior: Clip.antiAlias,
        child: Ink(
          height: 34,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 5,
                spreadRadius: 2,
                color: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.5),
                inset: true,
              ),
            ],
          ),
          child: InkWell(
            onTap: onPressed,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: child,
            ),
          ),
        ),
      );
}
