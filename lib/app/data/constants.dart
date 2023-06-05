class Urls {
  static const String _baseUrl = 'http://api.weatherapi.com/v1/forecast.json';
  static const String _apiKey = '8a0d123782b14144b6261122222205';

  static String currentWeather(String lat, String long) =>
      '$_baseUrl?q=$lat,$long&key=$_apiKey';

  static String weatherIcon(String iconUrl) =>
      'https://${((iconUrl).toString().substring(2)).replaceAll("64", "128")}';
}
