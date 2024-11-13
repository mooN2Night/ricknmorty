import 'package:rick_and_morty/core/params/page_person_params/get_all_person_params.dart';
import 'package:rick_and_morty/core/utils/failure_to_message.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/domain/usecases/get_all_persons.dart';
import 'package:rick_and_morty/feature/presentation/bloc/person_list_cubit/person_list_state.dart';
import 'package:bloc/bloc.dart';

class PersonListCubit extends Cubit<PersonState> {
  PersonListCubit({
    required this.getAllPersonsUseCase,
  }) : super(PersonEmpty());

  final GetAllPersonsUseCase getAllPersonsUseCase;
  int page = 1;

  void loadPerson() async {
    if (state is PersonLoading) return;

    final currentState = state;

    var oldPerson = <PersonEntity>[];
    if (currentState is PersonLoaded) {
      oldPerson = currentState.personsList;
    }

    emit(
      PersonLoading(
        oldPersonsList: oldPerson,
        isFirstFetch: page == 1,
      ),
    );

    final failureOrPerson = await getAllPersonsUseCase(
      GetAllPersonParams(page: page),
    );

    failureOrPerson.fold(
      (failure) => emit(
        PersonError(
          massage: mapFailureToMessage(failure),
        ),
      ),
      (person) {
        page++;
        final persons = (state as PersonLoading).oldPersonsList;
        persons.addAll(person);
        emit(
          PersonLoaded(persons),
        );
      },
    );
  }
}
