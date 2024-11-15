import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model/person_model.dart';
import 'package:dio/dio.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);

  Future<List<PersonModel>> searchPerson(String name, int page);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  PersonRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<PersonModel>> getAllPersons(int page) =>
      _getPersonFromUrl('character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String name, int page) =>
      _getPersonFromUrl('character/?name=$name&page=$page');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    try {
      final response = await dio.get(
        '${AppConstants.baseUrl}$url',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );

      if (response.statusCode == 200) {
        final persons = response.data;
        return List<PersonModel>.from(
          (persons['results'] as List)
              .map((person) => PersonModel.fromJson(person)),
        );
      } else {
        throw ServerException();
      }
    } on DioException {
      throw ServerException();
    }
  }
}
