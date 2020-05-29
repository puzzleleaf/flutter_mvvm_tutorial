class Constants {
  static const String API_KEY = '97604a4cfe784fc7a9ae242ac28b2c87';
  static const String TOP_HEADLINES_URL = 'https://newsapi.org/v2/top-headlines?country=kr&apiKey=97604a4cfe784fc7a9ae242ac28b2c87';

  static String headlinesFor(String keyword) {
    return 'https://newsapi.org/v2/top-headlines?country=kr&q=$keyword&apiKey=97604a4cfe784fc7a9ae242ac28b2c87';

  }
}