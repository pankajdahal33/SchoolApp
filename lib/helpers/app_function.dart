class AppFunction {
  //return day of month
  static String getDay(String date) {
    var parts = date.split("-");
    return parts[parts.length - 1];
  }

  static String getExtention(String url) {
    var parts = url.split("/");
    return parts[parts.length - 1];
  }
}
