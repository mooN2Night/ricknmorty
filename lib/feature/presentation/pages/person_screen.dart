import 'package:flutter/material.dart';
import 'package:rick_and_morty/feature/presentation/widgets/app_bar/app_bar.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_screen/persons_list_widget.dart';

class PersonScreen extends StatelessWidget {
  const PersonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return Scaffold(
      appBar: const CustomAppBar(
        showSearchIcon: true,
      ),
      body: PersonsList(
        scrollController: scrollController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => scrollController.animateTo(
          0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
        ),
        child: const Icon(Icons.arrow_upward),
      ),
    );
  }
}
