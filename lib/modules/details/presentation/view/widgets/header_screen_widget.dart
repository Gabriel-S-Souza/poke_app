import 'package:flutter/material.dart';

class HeaderScreenWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double fontSize;
  final int pokeId;

  const HeaderScreenWidget({
    Key? key,
    required this.title,
    this.fontSize = 16,
    required this.pokeId,
  }) : super(key: key);

  String get pokeIdFormatted => '#${pokeId.toString().padLeft(3, '0')}';

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                visualDensity: VisualDensity.compact,
                splashRadius: 28,
                icon: Transform.translate(
                  offset: const Offset(-2, 0),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    size: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            Text(
              pokeIdFormatted,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
