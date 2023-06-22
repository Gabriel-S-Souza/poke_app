import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';

class HeaderScreenWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double fontSize;
  final int? pokeId;

  const HeaderScreenWidget({
    Key? key,
    required this.title,
    this.fontSize = 16,
    required this.pokeId,
  }) : super(key: key);

  String get pokeIdFormatted => pokeId != null ? '#${pokeId!.toString().padLeft(3, '0')}' : '';

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: 46,
                child: IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.zero),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    maximumSize: MaterialStateProperty.all(const Size(50, 50)),
                  ),
                  splashRadius: 28,
                  iconSize: 36,
                  icon: Transform.translate(
                    offset: const Offset(-2, 0),
                    child: Transform.scale(
                      scale: 1.2,
                      child: Image.asset(
                        Assets.arrowBack,
                        width: 36,
                        height: 36,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: AutoSizeText(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
            ),
            Text(
              pokeIdFormatted,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
