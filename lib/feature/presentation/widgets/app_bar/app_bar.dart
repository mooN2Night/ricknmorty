import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/feature/presentation/widgets/search_screen/custom_search_delegate.dart';

import '../../../../core/providers/theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool showSearchIcon;

  const CustomAppBar({super.key, required this.showSearchIcon});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return AppBar(
      title: const Text(AppConstants.appName),
      actions: [
        Switch(
          value: themeProvider.isDarkTheme,
          onChanged: (value) {
            themeProvider.toggleTheme(value);
          },
        ),
        if (showSearchIcon)
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
