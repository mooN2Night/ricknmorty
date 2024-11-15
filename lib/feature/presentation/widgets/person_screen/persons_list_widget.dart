import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/bloc/person_list_cubit/person_list_cubit.dart';
import 'package:rick_and_morty/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_screen/person_card_widget.dart';

class PersonsList extends StatefulWidget {
  final ScrollController scrollController;

  const PersonsList({super.key, required this.scrollController});

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {

  void _setupScrollController(BuildContext context) {
    widget.scrollController.addListener(() {
      final position = widget.scrollController.position;
      if (position.pixels >= position.maxScrollExtent - 1000 &&
          context.read<PersonListCubit>().state is! PersonLoading) {
        context.read<PersonListCubit>().loadPerson();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _setupScrollController(context);
    return BlocBuilder<PersonListCubit, PersonState>(
      builder: (context, state) {
        List<PersonEntity> persons = [];

        if (state is PersonLoading && state.isFirstFetch) {
          return _loadingIndicator();
        } else if (state is PersonLoading) {
          persons = state.oldPersonsList;
        } else if (state is PersonLoaded) {
          persons = state.personsList;
        } else if (state is PersonError) {
          return Center(
            child: Text(state.massage),
          );
        }
        return ListView.builder(
          controller: widget.scrollController,
          itemCount: persons.length + (state is PersonLoading ? 1 : 0),
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          itemBuilder: (context, index) {
            if (index == persons.length) {
              return _loadingIndicator();
            }
            return PersonCard(
              person: persons[index],
            );
          },
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(
          strokeAlign: 10,
          color: AppConstants.greyColor,
        ),
      ),
    );
  }
}
