import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tarefa_2/core/error/exceptions.dart';

import '../models/person_model.dart';

abstract class PersonLocalDataSource {
  /// Gets the cached [PersonModel] wich was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<PersonModel> getlastPerson();

  Future<void> cachePerson(PersonModel personToCache);
}

const cachedPerson = 'CACHED_PERSON';

class PersonLocalDataSourceImpl implements PersonLocalDataSource {
  final SharedPreferences sharedPreferences;

  PersonLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<PersonModel> getlastPerson() {
    final jsonString = sharedPreferences.getString(cachedPerson);
    if (jsonString != null) {
      return Future.value(PersonModel.fromJson(jsonDecode(jsonString)));
    } else {
      throw CacheException('Não tem nada na cache!');
    }
  }

  @override
  Future<void> cachePerson(PersonModel personToCache) {
    sharedPreferences.setString(
      cachedPerson,
      jsonEncode(personToCache.toJson()),
    );
    return Future<void>.value();
  }
}
