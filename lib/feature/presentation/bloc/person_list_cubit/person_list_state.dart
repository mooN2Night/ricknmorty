import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

///Класс PersonState унаследован от Equatable
abstract class PersonState {
  const PersonState();
}

class PersonEmpty extends PersonState {}

class PersonLoading extends PersonState {
  final List<PersonEntity> oldPersonsList;
  final bool isFirstFetch;

  const PersonLoading({
    required this.oldPersonsList,
    this.isFirstFetch = false,
  });
}

class PersonLoaded extends PersonState {
  final List<PersonEntity> personsList;

  PersonLoaded(this.personsList);
}

class PersonError extends PersonState {
  final String massage;

  PersonError({required this.massage});
}
