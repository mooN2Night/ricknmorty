import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/utils/padding_for_text.dart';

import '../utils/resizable_dot.dart';

class PersonCard extends StatelessWidget {
  const PersonCard({super.key, required this.person});

  final PersonEntity person;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                child: Image.network(
                  person.image,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  paddingForText(
                    child: Text(
                      person.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  paddingForText(
                    child: Text(
                      '${person.gender} - ${person.species}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                  Row(
                    children: [
                      ResizableDot(
                        size: 5,
                        status: person.status,
                      ),
                      paddingForText(
                        child: Text(
                          person.status,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Last known location:',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  paddingForText(
                    child: Text(
                      person.location.name,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
