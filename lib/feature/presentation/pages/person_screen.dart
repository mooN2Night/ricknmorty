import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/providers/theme_provider.dart';
import 'package:rick_and_morty/feature/presentation/widgets/persons_list.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick and Morty'),
        actions: [
          Switch(
            value: ThemeProvider.of(context).isDarkTheme,
            onChanged: ThemeProvider.of(context).toggleTheme,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: PersonsList(),
    );
  }
}
