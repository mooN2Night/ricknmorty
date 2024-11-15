import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/usecases/usecase.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

import '../../../core/params/page_person_params/get_all_person_params.dart';
import '../repositories/person_repository.dart';

///Use Cases будут получать сущности из репозитория и передавать эти сущности на
///уровень представления
class GetAllPersonsUseCase extends UseCase<List<PersonEntity>, GetAllPersonParams> {
  GetAllPersonsUseCase(this.personRepository);

  final PersonRepository personRepository;

  ///Такое название идеально подойдет для Use Case`ов, тем более если Use Case`ов
  ///много, то придется для каждого метода придумывать новое название. К тому же
  ///в Dart методы с таким названием можно явно не указывать метод при вызове
  ///Use Case`ов, он будет вызываться автоматически
  @override
  Future<Either<Failure, List<PersonEntity>>> call(
    GetAllPersonParams params,
  ) async {
    return await personRepository.getAllPersons(params.page);
  }
}
