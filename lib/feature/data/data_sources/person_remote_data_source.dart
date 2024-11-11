import 'dart:convert';

import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model/person_model.dart';
import 'package:dio/dio.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons(int page);

  Future<List<PersonModel>> searchPerson(String name);
}

class PersonRemoteDataSourceImpl implements PersonRemoteDataSource {
  PersonRemoteDataSourceImpl({required this.dio});

  final Dio dio;

  @override
  Future<List<PersonModel>> getAllPersons(int page) =>
      _getPersonFromUrl('character/?page=$page');

  @override
  Future<List<PersonModel>> searchPerson(String name) =>
      _getPersonFromUrl('character/?name=$name');

  Future<List<PersonModel>> _getPersonFromUrl(String url) async {
    final response = await dio.get(
      '${AppConstants.baseUrl}$url',
      options: Options(headers: {'Content-Type': 'application/json'}),
    );
    if (response.statusCode == 200) {
      final persons = json.decode(response.data);
      return (persons['results'] as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
