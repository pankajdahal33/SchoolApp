class AppFunction {
  //return day of month
  static String getDay(String date) {
    var parts = date.split("-");
    return parts[parts.length - 1];
  }
}
