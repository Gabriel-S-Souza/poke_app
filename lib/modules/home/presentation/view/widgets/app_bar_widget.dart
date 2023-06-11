import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/assets.dart';
import 'radio_tile_widget.dart';
import 'sort_button_widget.dart';
import 'text_field_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final void Function(SortPokeBy)? onSort;
  final SortPokeBy currentSortBy;
  final void Function(String)? onSearch;
  final TextEditingController? searchController;

  const AppBarWidget({
    super.key,
    this.height = 124,
    this.onSort,
    this.currentSortBy = SortPokeBy.number,
    this.onSearch,
    this.searchController,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

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
                      onChanged: onSearch,
                      controller: searchController,
                      prefix: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
                      readOnly: false,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    SortButtonWidget(
                      onSelected: onSort,
                      currentSortBy: currentSortBy,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
