class DateUtil {
  static final DateUtil _instance = DateUtil._init();
  DateUtil._init();

  factory DateUtil() {
    return _instance;
  }

  String dateToIDayIMonthIYear({required DateTime date}) {
    return "${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}.${date.year}";
  }
}
