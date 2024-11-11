import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

abstract class PersonSearchState {
  const PersonSearchState();
}

class PersonEmpty extends PersonSearchState {}

class PersonSearchLoading extends PersonSearchState {}

class PersonSearchLoaded extends PersonSearchState {
  const PersonSearchLoaded({required this.persons});

  final List<PersonEntity>? persons;
}

class PersonSearchError extends PersonSearchState {
  const PersonSearchError({required this.message});

  final String message;
}
