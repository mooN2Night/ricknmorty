import 'dart:convert';

import 'package:rick_and_morty/core/constants/app_constants.dart';
import 'package:rick_and_morty/core/error/exception.dart';
import 'package:rick_and_morty/feature/data/models/person_model/person_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class PersonLocalDataSource {
  Future<List<PersonModel>> getLastPersonsFromCache();

  Future<void> personsToCache(List<PersonModel> persons);
}

class PersonLocalDataSourceImpl extends PersonLocalDataSource {
  PersonLocalDataSourceImpl({required this.sharedPreferences});

  final SharedPreferences sharedPreferences;

  //TODO в примере нету async/await, убрать в случае ошибок
  @override
  Future<List<PersonModel>> getLastPersonsFromCache() async {
    final jsonPersonsList =
        sharedPreferences.getStringList(AppConstants.cachePersonKey);
    if (jsonPersonsList != null) {
      return await Future.value(
        jsonPersonsList
            .map((person) => PersonModel.fromJson(json.decode(person)))
            .toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> personsToCache(List<PersonModel> persons) async {
    final List<String> jsonPersonsList = persons
        .map(
          (person) => json.encode(person.toJson()),
        )
        .toList();
    await sharedPreferences.setStringList(
      AppConstants.cachePersonKey,
      jsonPersonsList,
    );
  }
}
