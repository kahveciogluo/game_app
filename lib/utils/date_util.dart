import 'package:intl/intl.dart';

class DateUtil {
  static String dateFormatAsDDMMYYYY(DateTime dateTime) {
    var format = DateFormat('dd.MM.yyyy');
    return format.format(dateTime).toString();
  }
}
