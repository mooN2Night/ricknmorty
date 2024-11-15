import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

class PersonSearchWidget extends StatelessWidget {
  final PersonEntity searchPerson;

  const PersonSearchWidget({super.key, required this.searchPerson});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppConstants.appbarBorderRadius),
      ),
      child: Column(
        children: [
          Text(searchPerson.name),
        ],
      ),
    );
  }
}
