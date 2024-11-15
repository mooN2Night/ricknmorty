import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/presentation/utils/refactor_date.dart';
import 'package:rick_and_morty/feature/presentation/utils/resizable_dot.dart';
import 'package:rick_and_morty/feature/presentation/utils/text_padding_detail_screen.dart';
import 'package:rick_and_morty/feature/presentation/widgets/app_bar/app_bar.dart';
import 'package:rick_and_morty/feature/presentation/widgets/person_screen/person_cache_image_widget.dart';

class PersonDetailPage extends StatelessWidget {
  final PersonEntity person;

  const PersonDetailPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showSearchIcon: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                person.name,
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              AppConstants.mainTextPadding,
              PersonCacheImage(
                imageUrl: person.image,
                imageWidth: 300,
                imageHeight: 300,
                isFromMain: false,
              ),
              AppConstants.mainTextPadding,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ResizableDot(
                    size: 8,
                    status: person.status,
                  ),
                  Text(
                    person.status,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              ...getTextPair(context, 'Gender:', person.gender),
              ...getTextPair(context, 'Species:', person.species),
              if (person.type.isNotEmpty)
                ...getTextPair(context, 'Type:', person.type),
              ...getTextPair(
                context,
                'Number of episodes:',
                person.episode.length.toString(),
              ),
              ...getTextPair(
                context,
                'Last known location:',
                person.location.name,
              ),
              ...getTextPair(context, 'Origin:', person.origin.name),
              ...getTextPair(
                context,
                'Was created:',
                refactorDate(person.created),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
