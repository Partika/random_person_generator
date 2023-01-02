import '../models/person_model.dart';

abstract class PersonLocalDataSource {
  /// Gets the cached [PersonModel] wich was gotten the last time
  /// the user had an internet connection
  ///
  /// Throws a [CacheException] if no cached data is present.
  Future<PersonModel> getlastPerson();

  Future<void> cachePerson(PersonModel personToCache);
}
