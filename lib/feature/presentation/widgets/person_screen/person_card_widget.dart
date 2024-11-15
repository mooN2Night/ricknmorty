import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/utils/text_padding_person_screen.dart';
import 'package:rick_and_morty/feature/presentation/utils/resizable_dot.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_screen/person_cache_image_widget.dart';
import 'package:rick_and_morty/feature/presentation/pages/person_detail_screen.dart';

class PersonCard extends StatelessWidget {
  final PersonEntity person;

  const PersonCard({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PersonDetailPage(
              person: person,
            ),
          ),
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(AppConstants.appbarBorderRadius),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PersonCacheImage(
                imageUrl: person.image,
                imageWidth: 200,
                imageHeight: 200,
                isFromMain: true,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textPaddingForPerson(
                      child: Text(
                        person.name,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    textPaddingForPerson(
                      child: Text(
                        '${person.species} - ${person.gender}',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Row(
                      children: [
                        ResizableDot(
                          size: 6,
                          status: person.status,
                        ),
                        textPaddingForPerson(
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
                    textPaddingForPerson(
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
      ),
    );
  }
}
