DateTime get now => DateTime.now();
// This add a timestamp to a given URL
String addTimestampToUrl(String baseUrl) {
  return '$baseUrl?time=${now.toIso8601String()}';
}
