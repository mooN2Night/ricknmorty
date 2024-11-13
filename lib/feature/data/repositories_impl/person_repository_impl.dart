import 'package:fpdart/fpdart.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/core/error/failure.dart';
import 'package:rick_and_morty/core/platform/network_info.dart';
import 'package:rick_and_morty/feature/data/data_sources/person_local_data_source.dart';
import 'package:rick_and_morty/feature/data/data_sources/person_remote_data_source.dart';
import 'package:rick_and_morty/feature/data/mapper/mapper.dart';
import 'package:rick_and_morty/feature/data/models/person_model/person_model.dart';
import 'package:rick_and_morty/feature/domain/entities/person_entity/person_entity.dart';
import 'package:rick_and_morty/feature/domain/repositories/person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  PersonRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
    required this.mapper,
  });

  final PersonRemoteDataSource remoteDataSource;
  final PersonLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  final Mapper mapper;

  @override
  Future<Either<Failure, List<PersonEntity>>> getAllPersons(int page) async {
    return await _getPersons(() => remoteDataSource.getAllPersons(page));
  }

  @override
  Future<Either<Failure, List<PersonEntity>>> searchPerson(String name) async {
    return await _getPersons(() => remoteDataSource.searchPerson(name));
  }

  Future<Either<Failure, List<PersonEntity>>> _getPersons(
    Future<List<PersonModel>> Function() getPersons,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remotePersonModel = await getPersons();

        localDataSource.personsToCache(remotePersonModel);

        final remotePersonEntities =
            //TODO маппер из папки core/extension
            //     remotePersonModel.map((person) => person.toEntity()).toList();
            //TODO маппер из папуа lib/data/mapper
            remotePersonModel
                .map((person) => mapper.personToEntity(person))
                .toList();

        return Right(remotePersonEntities);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localPersonModel =
            await localDataSource.getLastPersonsFromCache();

        final localPersonEntities =
            //TODO маппер из папки core/extension
            //     localPersonModel.map((person) => person.toEntity()).toList();
            //TODO маппер из папуа lib/data/mapper
            localPersonModel
                .map((person) => mapper.personToEntity(person))
                .toList();

        return Right(localPersonEntities);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
