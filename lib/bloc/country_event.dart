
abstract class CountryEvent {
}

class FetchCountries extends CountryEvent {
  final String query;
  FetchCountries(this.query);
}
