// lib/core/utils/date_formatter.dart

import 'package:intl/intl.dart';

class DateFormatter {
  static String formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}