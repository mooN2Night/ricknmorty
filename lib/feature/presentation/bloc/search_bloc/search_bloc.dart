import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/params/name_person_params/search_person_params.dart';
import 'package:rick_and_morty/feature/domain/usecases/search_person.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_event.dart';
import 'package:rick_and_morty/feature/presentation/bloc/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonSearchBloc extends Bloc<PersonSearchEvent, PersonSearchState> {
  PersonSearchBloc(super.initialState, {required this.searchPersons});

  final SearchPerson searchPersons;

  Stream<PersonSearchState> mapEventToState(PersonSearchEvent event) async* {
    if (event is SearchPersons) {
      yield* _mapFetchPersonsToState(event.personQuery);
    }
  }

  // PersonSearchBloc() : super(PersonEmpty()) {
  //   on<SearchPersons>(event, emit) {
  //     if (event is SearchPersons) {
  //       _mapFetchPersonsToState();
  //     }
  //   };
  // }

  Stream<PersonSearchState> _mapFetchPersonsToState(String personQuery) async* {
    yield PersonSearchLoading();

    final failureOrPerson = await searchPersons(
      SearchPersonParams(name: personQuery),
    );

    yield failureOrPerson.fold(
      (failure) => PersonSearchError(message: _mapFailureToMessage(failure)),
      (person) => PersonSearchLoaded(
        persons: person,
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      case CacheFailure:
        return 'Cache Failure';
      default:
        return 'Unepected Error';
    }
  }
}
