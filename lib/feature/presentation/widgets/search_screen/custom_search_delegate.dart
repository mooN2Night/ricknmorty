import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/constants/theme_constants.dart';
import 'package:rick_and_morty/core/providers/theme_provider.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_screen/person_card_widget.dart';

class CustomSearchDelegate extends SearchDelegate {
  CustomSearchDelegate() : super(searchFieldLabel: 'Search for characters');

  final _suggestions = [
    'Rick',
    'Morty',
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  ThemeData appBarTheme(BuildContext context) {
    final themeProvider = ThemeProvider.of(context);
    return themeProvider.isDarkTheme
        ? ThemeConstants.searchDarkTheme
        : ThemeConstants.searchLightTheme;
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    BlocProvider.of<PersonSearchBloc>(context, listen: false).add(
      SearchPersons(query),
    );
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        // Trigger loading more characters when near the bottom of the list
        BlocProvider.of<PersonSearchBloc>(context, listen: false).add(
          SearchPersons(query),
        );
      }
    });

    return BlocBuilder<PersonSearchBloc, PersonSearchState>(
      builder: (context, state) {
        List<PersonEntity> searchPersons = [];
        if (state is PersonSearchLoading) {
          searchPersons = state.oldPersonsList ?? [];
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonSearchLoaded) {
          searchPersons = state.persons;
          return ListView.builder(
            controller: _scrollController,
            itemCount: searchPersons.isNotEmpty ? searchPersons.length : 0,
            itemBuilder: (context, index) {
              if (searchPersons.isNotEmpty) {
                return PersonCard(
                  person: searchPersons[index],
                );
              } else {
                return _showErrorText('No characters with that name(...');
              }
            },
          );
        } else if (state is PersonSearchError) {
          return _showErrorText(state.message);
        } else {
          return const Center(
            child: Icon(Icons.now_wallpaper),
          );
        }
      },
    );
  }

  Widget _showErrorText(String error) {
    return Center(
      child: Text(error),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isNotEmpty) {
      return const SizedBox.shrink();
    }
    return ListView.separated(
      itemCount: _suggestions.length,
      separatorBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Divider(
            color: AppConstants.greyColor,
          ),
        );
      },
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text(
            _suggestions[index],
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
      },
    );
  }
}
