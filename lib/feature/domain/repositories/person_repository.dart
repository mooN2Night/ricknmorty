import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';

///У нас могут прийти как данные, так и ошибка, мы не хотим отлавливать ошибку
///где-то в других местах в коде, поэтому мы используем библиотеку fpdart, из
///неё мы достаем Either<L, R>, где L - это ошибка, а R - это наши данные
abstract class PersonRepository {
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page);

  Future<Either<Failure, List<PersonEntity>>> searchPerson(String name);
}