class Constants {
  static const String API_KEY = '97604a4cfe784fc7a9ae242ac28b2c87';
  static const String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=us&apiKey=$API_KEY';

  static String headlinesFor(String country) {
    return 'https://newsapi.org/v2/top-headlines?country=$country&apiKey=$API_KEY';
  }

  static const Map<String, String> Countries = {
    "United States of America" : "us",
    "India" : "in",
    "Korea" : "kr",
    "China" : "ch"
  };
}