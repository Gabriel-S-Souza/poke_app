import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'icon_button_widget.dart';
import 'text_field_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  const AppBarWidget({super.key, this.height = 80});

  @override
  Widget build(BuildContext context) => Container(
        height: preferredSize.height,
        padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 16),
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Assets.pokeballImg,
                  height: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: AutoSizeText(
                      'Pokédex',
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      maxFontSize: 24,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 36,
                    child: TextFieldWidget(
                      hint: 'Search',
                      onChanged: (value) {},
                      prefix: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
                      readOnly: true,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                IconButtonApp(
                  onPressed: () {},
                  child: Image.asset(
                    Assets.hash,
                    height: 24,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(height);
}
