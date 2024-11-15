import 'package:rick_and_morty/core/params/name_person_params/search_person_params.dart';
import 'package:rick_and_morty/core/utils/failure_to_message.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_person.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  final SearchPersonUseCase searchPersonsUseCase;
  int page = 1;

  PersonSearchBloc({required this.searchPersonsUseCase})
      : super(PersonSearchEmpty()) {
    on<SearchPersons>(_mapFetchPersonsToState);
  }

  _mapFetchPersonsToState(
    SearchPersons event,
    Emitter<PersonSearchState> emit,
  ) async {
    emit(PersonSearchLoading());

    var oldPersonsList = <PersonEntity>[];

    final currentState = state;

    if (currentState is PersonSearchLoaded) {
      oldPersonsList = currentState.persons;
    }

    emit(PersonSearchLoading(oldPersonsList: oldPersonsList));

    final result = await searchPersonsUseCase(
      SearchPersonParams(name: event.personQuery, page: page),
    );

    result.fold(
        (failure) =>
            emit(PersonSearchError(message: mapFailureToMessage(failure))),
        (person) {
      page++;
      final persons = (state as PersonSearchLoading).oldPersonsList;
      persons?.addAll(person);
      emit(
        PersonSearchLoaded(
          persons: person,
        ),
      );
    });
  }
// PersonSearchBloc(super.initialState, {required this.searchPersonsUseCase});

// Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
//   if (event is SearchPersons) {
//     yield* _mapFetchPersonsToState(event.personQuery);
//   }
// }

// Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
//   yield PersonSearchLoading();
//
//   final failureOrPerson = await searchPersons(
//     SearchPersonParams(name: personQuery),
//   );
//
//   yield failureOrPerson.fold(
//     (failure) => PersonSearchError(message: mapFailureToMessage(failure)),
//     (person) => PersonSearchLoaded(
//       persons: person,
//     ),
//   );
// }
}
